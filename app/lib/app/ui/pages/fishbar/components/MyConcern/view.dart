import 'package:app_config/app_config.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../index.dart';
import 'index.dart';

class MyConcern extends StatefulWidget {
  const MyConcern({Key? key, required this.headerAnimated}) : super(key: key);
  final headerAnimated;
  @override
  _MyConcernState createState() => _MyConcernState();
}

class _MyConcernState extends State<MyConcern> with DYBase {
  MyConcernController controller =
      Get.put<MyConcernController>(MyConcernController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Obx(() => _buildBody(context));
    return _buildBody(context);
  }

  // 渲染我的活动功能
  Widget _renderMyActive() {
    return Wrap(
      children: controller.myActive
          .asMap()
          .map((i, item) {
            return MapEntry(
              i,
              Container(
                width: (MediaQuery.of(context).size.width - 20) / 4,
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: dp(16),
                      ),
                      child: Image.asset(
                        'assets/images/bar/tab-$i.png',
                        width: dp(70),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: dp(8),
                      ),
                      child: Text(
                        item,
                        style: const TextStyle(color: Color(0xff333333)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          })
          .values
          .toList(),
    );
  }

  Widget _buildBody(BuildContext context) {
   return Stack(
      children: <Widget>[
        Container(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: DYrefreshHeader(),
            footer: DYrefreshFooter(),
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            child: ListView(
              // controller: _scrollController,
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: dp(15), left: dp(10), right: dp(10)),
                  child: _renderMyActive()
                ),
                Padding(
                  key: controller.hourTitleKey,
                  padding: EdgeInsets.only(
                    left: dp(15), right: dp(15), top: dp(5), bottom: dp(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/bar/day-title.png',
                        height: dp(16),
                      ),
                      Padding(padding: EdgeInsets.only(left: dp(6)),),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          '每日斗鱼',
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/bar/usefulSelect.webp',
                        height: dp(25),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: const Color(0xfff3f3f3),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(dp(15)),
                        child: const FishBarCardList(
                          // hourTitleKey: controller.hourTitleKey,
                          // refreshController: controller.refreshController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.only( left: dp(10), right: dp(8), top: dp(6), bottom: dp(6) ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(dp(20)),
                bottomLeft: Radius.circular(dp(20)),
              ),
              boxShadow: [
                BoxShadow(color: const Color.fromARGB(50, 92, 92, 92), offset: Offset(dp(-1), dp(5)), blurRadius: dp(4), spreadRadius: dp(-2)),
              ],
            ),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/bar/hot-title.png',
                  height: dp(16),
                ),
                Padding(
                  padding: EdgeInsets.only(right: dp(5)),
                ),
                const Text(
                  '斗鱼24小时精彩'
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<MyConcernController>();
    super.dispose();
  }
}
