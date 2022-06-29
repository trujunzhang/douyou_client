import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import '../../../routes/params_helper.dart';

import 'state.dart';

class PageInDevelopController extends GetxController {
  final _bottomNavList = ["推荐", "娱乐", "鱼吧", "关注", "发现"]; // 底部导航
  int _currentIndex = 4;

  get appBarTitle => _bottomNavList[_currentIndex];

  final state = PageInDevelopState();

  @override
  void onInit() {
    super.onInit();
  }

//==========================================================
// UI Events
//==========================================================
  void openTestPage(BuildContext context) {
    // Navigator.pushNamed(context, '/develop');
  }
}
