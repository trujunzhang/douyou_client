import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:dy_getx/app/ui/pages/commend/view.dart';
import 'package:dy_getx/app/ui/pages/fishbar/view.dart';
import 'package:dy_getx/app/ui/pages/focus/view.dart';
import 'package:dy_getx/app/ui/pages/funny/view.dart';
import 'package:dy_getx/app/ui/pages/page_in_develop/view.dart';
import 'package:my_plugin/my_plugin.dart';

import 'index.dart';

class HomePage extends GetWidget<HomeController> with DYBase {
  const HomePage({Key? key}) : super(key: key);

  Widget _bottomIcon(path) {
    return Padding(
        padding: EdgeInsets.only(bottom: dp(4)),
        child: Image.asset(
          path,
          width: dp(25),
          height: dp(25),
          repeat: ImageRepeat.noRepeat,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.lastCloseApp == null ||
            DateTime.now().difference(controller.lastCloseApp!) >
                const Duration(seconds: 1)) {
          controller.lastCloseApp = DateTime.now();
          // Fluttertoast.showToast(msg: '再按一次退出斗鱼');
          return false;
        }
        return true;
      },
      child: BaseScaffold(
          resizeToAvoidBottomInset: true,
          // 底部导航栏
          bottomNavigationBar: Obx(() => _buildBottomNavigationBar(context)),
          // appBar: MyAppBar(
          //   centerTitle: true,
          //   // title: MyTitle(S.of(context).drawerMenuItemAbout),
          //   leadingType: AppBarBackType.None,
          // ),
          // body: Obx(() => _buildBody(context)));
          body: _buildBody(context)),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    int _currentIndex = controller.state.currentIndex.value;
    List<String> _bottomNavList = controller.bottomNavList;
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: DYBase.defaultColor,
        unselectedItemColor: const Color(0xff333333),
        selectedFontSize: dp(12),
        unselectedFontSize: dp(12),
        onTap: (index) {
          controller.onTapBottomBarItem(index);
        },
        items: [
          BottomNavigationBarItem(
              label: _bottomNavList[0],
              icon: _currentIndex == 0
                  ? _bottomIcon('assets/images/nav/nav-12.jpg')
                  : _bottomIcon('assets/images/nav/nav-11.jpg')),
          BottomNavigationBarItem(
              label: _bottomNavList[1],
              icon: _currentIndex == 1
                  ? _bottomIcon('assets/images/nav/nav-22.jpg')
                  : _bottomIcon('assets/images/nav/nav-21.jpg')),
          BottomNavigationBarItem(
              label: _bottomNavList[2],
              icon: _currentIndex == 2
                  ? _bottomIcon('assets/images/nav/nav-42.jpg')
                  : _bottomIcon('assets/images/nav/nav-41.jpg')),
          BottomNavigationBarItem(
              label: _bottomNavList[3],
              icon: _currentIndex == 3
                  ? _bottomIcon('assets/images/nav/nav-32.jpg')
                  : _bottomIcon('assets/images/nav/nav-31.jpg')),
          BottomNavigationBarItem(
              label: _bottomNavList[4],
              icon: _currentIndex == 4
                  ? _bottomIcon('assets/images/nav/nav-52.jpg')
                  : _bottomIcon('assets/images/nav/nav-51.jpg')),
        ]);
  }

  Widget _buildBody(BuildContext context) {
    var _pages = [
      const CommendPage(),
      const FunnyPage(),
      const FishBarPage(),
      const FocusPage(),
      const PageInDevelopPage(),
    ];

    return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        itemCount: _pages.length,
        // itemBuilder: (context, index) => _pages[index]);
        itemBuilder: (context, index) => keepAliveWrapper(_pages[index]));
  }
}
