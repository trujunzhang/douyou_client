import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import '../../../routes/params_helper.dart';

import 'state.dart';

class HomeController extends GetxController {
  final List<String> bottomNavList = ["推荐", "娱乐", "鱼吧", "关注", "发现"]; // 底部导航
  DateTime? lastCloseApp; //上次点击返回按钮时间
  ScrollController scrollController = ScrollController(); // 首页整体滚动控制器
  PageController pageController = PageController();

  final state = HomeState();

  // 点击悬浮标回到顶部
  void indexPageScrollTop() {
    scrollController.animateTo(.0,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

//==========================================================
// UI Events
//==========================================================
  onIconPress() {}

  void onTapBottomBarItem(int index) {
    state.currentIndex.value = index;
    pageController.jumpToPage(index);
  }
}
