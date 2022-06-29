import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';

import 'index.dart';

class Lottery extends StatefulWidget {
  const Lottery({Key? key}) : super(key: key);
  static final List lotteryInOrder = <int>[
    0,
    1,
    2,
    5,
    8,
    7,
    6,
    3
  ]; // 九宫格奖品顺序对应Widget索引

  @override
  _LotteryState createState() => _LotteryState();
}

class _LotteryState extends State<Lottery> with DYBase {
  LotteryController controller =
      Get.put<LotteryController>(LotteryController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
    // return _buildBody(context);
  }

  List<Widget> _renderLotteryItem(BuildContext context) {
    LotteryConfig? lotteryConfig = controller.state.lotteryConfig.value;
    int? runCount = controller.state.runCount.value;
    if (lotteryConfig == null) {
      return [Gaps.empty];
    }
    var inOrder = Lottery.lotteryInOrder,
        height = dp(lotteryConfig.lotteryH! / 3),
        width = dp(lotteryConfig.lotteryW! / 3);
    return List.filled(9, null, growable: false)
        .asMap()
        .map((i, item) {
          if (i == 4) {
            return MapEntry(
              i,
              GestureDetector(
                onTap: () {
                  controller.startLottery(context);
                },
                child: Container(
                  width: width,
                  height: height,
                  color: Colors.transparent,
                ),
              ),
            );
          }
          return MapEntry(
              i,
              Container(
                width: width,
                height: height,
                decoration:
                    runCount != null && i == inOrder[runCount % inOrder.length]
                        ? BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(lotteryConfig.highLightBg!),
                              fit: BoxFit.fill,
                            ),
                          )
                        : null,
              ));
        })
        .values
        .toList();
  }

  Widget _buildBody(BuildContext context) {
    LotteryConfig? lotteryConfig = controller.state.lotteryConfig.value;
    if (lotteryConfig == null) {
      return Gaps.empty;
    }
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(dp(20)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(dp(25)),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      color: const Color(0xffff9434),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: dp(lotteryConfig.pageH!),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(lotteryConfig.pageBg!),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  child: Transform.scale(
                    scale: 0.9,
                    child: Container(
                      width: dp(lotteryConfig.lotteryW!),
                      height: dp(lotteryConfig.lotteryH!),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(lotteryConfig.lotteryBg!),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Wrap(
                        children: _renderLotteryItem(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => DYdialog.alert(context, text: '正在建设中~'),
                child: Container(
                  width: dp(lotteryConfig.myRewardW!),
                  height: dp(lotteryConfig.myRewardH!),
                  margin: EdgeInsets.only(bottom: dp(10)),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(lotteryConfig.myRewardBg!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<LotteryController>();
    super.dispose();
  }
}
