import 'package:app_config/app_config.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_plugin/my_plugin.dart';

import 'index.dart';
import 'components/index.dart';

class FunnyPage extends GetWidget<FunnyController> with DYBase {
  const FunnyPage({Key? key}) : super(key: key);

  buildTabBar() {
    Widget tabBar = TabBar(
      isScrollable: true,
      unselectedLabelStyle: const TextStyle(
        fontSize: 15,
      ),
      labelStyle: const TextStyle(
        fontSize: 18,
      ),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorColor: Colors.white,
      indicatorWeight: 3,
      indicatorSize: TabBarIndicatorSize.label,
      controller: controller.tabController,
      tabs: controller.tabs.map((e) => Tab(text: e)).toList(),
    );

    return tabBar;
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        // appBar: MyAppBar(
        //   centerTitle: true,
        //   // title: MyTitle(S.of(context).drawerMenuItemAbout),
        //   leadingType: AppBarBackType.None,
        // ),
        appBar: PreferredSize(
          child: AppBar(
            bottom: buildTabBar(),
            centerTitle: true,
            // backgroundColor: Colors.white,
            actions: const <Widget>[
              DyHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Color(0xffff8633), Color(0xffff6634)],
                ),
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.light,
            toolbarTextStyle: const TextTheme(
              headline6: TextStyle(
                color: Colors.white,
              ),
            ).bodyText2,
            titleTextStyle: const TextTheme(
              headline6: TextStyle(
                color: Colors.white,
              ),
            ).headline6,
          ),
          preferredSize: Size.fromHeight(49 + dp(55)),
        ),
        // body: Obx(() => _buildBody(context)));
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    Widget tabBarBodyView = TabBarView(
      controller: controller.tabController,
      //创建Tab页
      children: controller.tabs
          .asMap()
          .map((i, e) {
            if (i == 0) {
              // 九宫格抽奖
              return MapEntry(i, const Lottery());
            }
            return MapEntry(
                i,
                Container(
                  alignment: Alignment.center,
                  child: Text(e, textScaleFactor: 1),
                ));
          })
          .values
          .toList(),
    );
    return tabBarBodyView;
  }
}
