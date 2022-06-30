import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';
import 'components/index.dart';

class CommendPage extends GetWidget<CommendController> with DYBase {
  const CommendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        // appBar: MyAppBar(
        //   centerTitle: true,
        //   // title: MyTitle(S.of(context).drawerMenuItemAbout),
        //   leadingType: AppBarBackType.None,
        // ),
        body: Obx(() => _buildBody(context)));
    // body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    List<String> navList = controller.state.navMenus.value;
    if (navList.isEmpty) {
      return const Scaffold(body: null);
    }
    return Scaffold(
      body: DefaultTabController(
        length: navList.length,
        child: NestedScrollView(
          // 嵌套式滚动视图
          controller: controller.scrollController,
          headerSliverBuilder: (context, innerScrolled) => <Widget>[
            /// 使用[SliverAppBar]组件实现下拉收起头部的效果
            SliverAppBar(
              backgroundColor: const Color(0xffff6634),
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: dp(55) + 49,
              actions: const <Widget>[
                DyHeader(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                // 下拉渐入背景
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      colors: <Color>[Color(0xffff8633), Color(0xffff6634)],
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                indicator: const BoxDecoration(),
                isScrollable: true,
                //设置tab文字得类型
                unselectedLabelStyle: const TextStyle(
                  fontSize: 15,
                ),
                labelStyle: const TextStyle(
                  fontSize: 18,
                ),
                //设置tab选中得颜色
                labelColor: Colors.white,
                //设置tab未选中得颜色
                unselectedLabelColor: Colors.white70,
                //设置自定义tab的指示器，CustomUnderlineTabIndicator
                //若不需要自定义，可直接通过
                // indicatorColor: Colors.white,  // 设置指示器颜色
                indicatorWeight: 3,
                // 设置指示器厚度
                //indicatorPadding
                //indicatorSize  设置指示器大小计算方式
                ///指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
                // indicatorSize: TabBarIndicatorSize.label,
                tabs: navList.map((e) => Tab(text: e)).toList(),
              ),
              forceElevated: innerScrolled,
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          ],
          body: TabBarView(
            children: navList
                .asMap()
                .map(
                  (i, tab) => MapEntry(
                    i,
                    Builder(builder: (context) => _buildTabBarPage(context, i)),
                  ),
                )
                .values
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarPage(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      child: ScrollConfiguration(
        behavior: DyBehaviorNull(),
        child: RefreshConfiguration(
          headerTriggerDistance: dp(80),
          maxOverScrollExtent: dp(100),
          footerTriggerDistance: dp(50),
          maxUnderScrollExtent: 0,
          headerBuilder: () => DYrefreshHeader(),
          footerBuilder: () => DYrefreshFooter(),
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            footer: DYrefreshFooter(
              bgColor: const Color(0xfff1f5f6),
            ),
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            child: CustomScrollView(
              // physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    child: index == 0
                        ? Column(
                            children: const [
                              // SwiperList(),
                              // CateList(),
                              // BroadCastSwiper(),
                              LiveList(),
                            ],
                          )
                        : null,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
