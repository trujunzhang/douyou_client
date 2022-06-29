import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import '../../../routes/params_helper.dart';

import 'state.dart';

class FunnyController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<String> tabs = ['抽奖', '竞猜', '答题', '充能', '太空探险', '幻神降临', '幸运水晶']; // 顶部导航栏

  late TabController tabController; // 导航栏切换Controller

  final state = FunnyState();

  @override
  void onInit() async {
    tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);

    super.onInit();
  }

//==========================================================
// UI Events
//==========================================================
  onIconPress() {}
}
