import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import 'state.dart';

class BroadCastSwiperController extends GetxController {
  // PageController pageController = Get.find();

  ApiClient apiClient = ApiUtil.getApiClient();
  final state = BroadCastSwiperState();

  @override
  void onInit() async {
    BaseResultResponse<BroadCast> broadCastResponse = await apiClient.getBroadcast();
    state.broadCastList.value = broadCastResponse.data!;
    super.onInit();
  }

  String formatTime(int timeSec) {
    var date = DateTime.fromMillisecondsSinceEpoch(timeSec * 1000);
    return '${date.month.toString().padLeft(2,'0')}/${date.day.toString().padLeft(2,'0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} ';
  }

  void changeOrderStatus(BroadCast item) {
    var current = item.order;
    // setState(() {
    //   item['order'] = !current;
    // });
    // if (current) {
      // Fluttertoast.showToast(msg: '已取消订阅');
    // } else {
    //   // Fluttertoast.showToast(msg: '已订阅');
    // }
  }
//==========================================================
// UI Events
//==========================================================
  onIconPress() {}

}
