import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';

import 'index.dart';

class BroadCastSwiper extends StatefulWidget {
  const BroadCastSwiper({Key? key}) : super(key: key);

  @override
  _BroadCastSwiperState createState() => _BroadCastSwiperState();
}

class _BroadCastSwiperState extends State<BroadCastSwiper> with DYBase {
  BroadCastSwiperController controller =
      Get.put<BroadCastSwiperController>(BroadCastSwiperController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
    // return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: dp(15), right: dp(15)),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xfffbfbfb),
            width: 1,
          )
        )
      ),
      height: dp(40),
      child: _waitBroadcastSwiperData(),
    );
  }

  Widget _waitBroadcastSwiperData() {
    List<BroadCast> _broadcastList = controller.state.broadCastList.value;
    if (_broadcastList.isEmpty) {
      return const SizedBox();
    } else if (_broadcastList.isNotEmpty) {
      return Swiper(
        itemBuilder: (BuildContext context, int index) => Container(
          child: Row(
            children: <Widget>[
              Image.asset(
                index % 2 == 0
                    ? 'assets/images/cjf.webp'
                    : 'assets/images/broadcast.webp',
                height: dp(20),
              ),
              Padding(
                padding: EdgeInsets.only(right: dp(5)),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  _broadcastList[index].title!,
                  style: TextStyle(
                    color: const Color(0xff333333),
                    fontSize: dp(12.5),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: dp(5)),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: const Color(0xff999999),
                    fontSize: dp(12.5),
                  ),
                  children: [
                    TextSpan(
                      text: controller.formatTime(_broadcastList[index].time!),
                    ),
                    TextSpan(
                      text: DYservice.formatNum(_broadcastList[index].num!),
                      style: const TextStyle(color: DYBase.defaultColor),
                    ),
                    const TextSpan(
                      text: '人预定',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: dp(5)),
              ),
              GestureDetector(
                onTap: () => controller.changeOrderStatus(_broadcastList[index]),
                child: Container(
                  padding: EdgeInsets.only(
                    left: dp(8),
                    right: dp(8),
                    top: dp(3),
                    bottom: dp(3),
                  ),
                  child: Text(
                    _broadcastList[index].order! ? '已预订' : '预订',
                    style: TextStyle(
                      color: _broadcastList[index].order!
                          ? Colors.white
                          : DYBase.defaultColor,
                      fontSize: 11,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: _broadcastList[index].order!
                        ? const Color(0xffd9d9d9)
                        : Colors.transparent,
                    border: _broadcastList[index].order!
                        ? null
                        : Border.all(
                            color: const Color(0xffffd2a6), width: dp(.7)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(dp(4)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        itemCount: _broadcastList.length,
        scrollDirection: Axis.vertical,
        autoplay: true,
        duration: 1500,
        autoplayDelay: 4500,
        curve: Curves.linear,
      );
    }

    return Gaps.empty;
  }

  @override
  void dispose() {
    Get.delete<BroadCastSwiperController>();
    super.dispose();
  }
}
