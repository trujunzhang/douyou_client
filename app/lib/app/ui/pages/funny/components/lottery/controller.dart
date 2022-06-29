import 'package:app_config/app_config.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:app_rest/app_rest.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

import 'state.dart';

class LotteryController extends GetxController {
  // PageController pageController = Get.find();

  final int roundBase = 2; // 九宫格匀速转动的基础圈数
  final int slowStep = 7; // 在转到奖品前缓速的步数
  final double slowMultiple = 1.7; // 每次缓速间隔时间的倍率

  ApiClient apiClient = ApiUtil.getApiClient();
  final state = LotteryState();

  Timer? timer; // 转动时的计时器
  // Map lotteryResult;    // 服务端返回的抽奖结果
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void onInit() async {
    LotteryConfigResponse lotteryConfigResponse =
        await apiClient.getLotteryConfig();
    state.lotteryConfig.value = lotteryConfigResponse.lotteryConfig!;
    super.onInit();
  }

  // 九宫格匀速计时器
  void _lotteryTimer(BuildContext context) {
    timer = Timer(const Duration(milliseconds: 100), () {
      state.runCount.value = state.runCount.value! + 1;
      int runCount = state.runCount.value!;
      LotteryResult lotteryResult = state.lotteryResult.value!;
      if (runCount <= 8 * roundBase) {
        // 首先转动基础圈数，这个时候顺便等待抽奖接口异步结果
        _lotteryTimer(context);
      } else if (runCount <=
          8 * (roundBase + 1) + lotteryResult.giftIndex! - slowStep) {
        // 转满基础圈数后，计算出多转一圈 + 结果索引 - 缓速步数，进行最后几步的匀速转动
        _lotteryTimer(context);
      } else {
        // 匀速结果，进入开奖前缓速转动
        _slowLotteryTimer(context, 100);
      }
    });
  }

  // 九宫格缓速计时器
  void _slowLotteryTimer(BuildContext context, ms) {
    LotteryResult lotteryResult = state.lotteryResult.value!;
    timer = Timer(Duration(milliseconds: ms), () {
      state.runCount.value = state.runCount.value! + 1;
      int runCount = state.runCount.value!;
      if (runCount < 8 * (roundBase + 1) + lotteryResult.giftIndex!) {
        // 如果当前步数没有达到结果位置，继续缓速转动，并在下一步增长缓速时间，实现越来越慢的开奖效果
        _slowLotteryTimer(context, (ms * slowMultiple).ceil());
      } else {
        // 已转到开奖位置，弹窗提醒
        if (lotteryResult.giftIndex == 3) {
          DYdialog.alert(
            context,
            title: '很遗憾~',
            text: '谢谢参与',
            yesCallBack: () => {state.runCount.value = null},
          );
        } else {
          var title = '中奖了！', body = '恭喜您获得 ${lotteryResult.giftName}';
          DYdialog.alert(
            context,
            title: title,
            text: body,
            yesCallBack: () => {state.runCount.value = null},
          );
          _showNotification(title, body);
        }
        timer?.cancel();
        timer = null;
      }
    });
  }

  // 系统通知栏消息推送
  void _showNotification(String title, String body) async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/dy');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async =>
                null);
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      print('notification payload: ' + payload!);
      // 点击通知栏跳转的页面(暂为空白)
      // await Navigator.push(
      //   context,
      //   new MaterialPageRoute(builder: (context) => Container(color: Colors.white,)),
      // );
    });

    // var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    //   '0', title, body,
    //   importance: Importance.max, priority: Priority.high, ticker: 'ticker',
    // );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        // android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        DYservice.randomBit(8, type: 'num'),
        title,
        body,
        platformChannelSpecifics,
        payload: body);
  }

  // 点击开始抽奖
  void startLottery(BuildContext context) async {
    // 防止重复点击
    if (timer != null) {
      return;
    }
    // 初始化九宫格抽奖
    state.runCount.value = 0;
    state.lotteryResult.value = null;
    // 开始计时器转动
    // _lotteryTimer(context);

    // 同时请求抽奖结果
    LotteryResultResponse lotteryResultResponse =
        await apiClient.getLotteryResult();
    state.lotteryResult.value = lotteryResultResponse.data!;

    var title = '中奖了！', body = '恭喜您获得 wh';
    _showNotification(title, body);
  }

//==========================================================
// UI Events
//==========================================================
  onIconPress() {}
}
