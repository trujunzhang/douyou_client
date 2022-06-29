import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import 'state.dart';

class CateListController extends GetxController {
  // PageController pageController = Get.find();

  final state = CateListState();

  List<String> tab = [
    '好声音',
    '舞蹈',
    '电子竞技',
    '颜值',
    '主机游戏',
    '打榜',
    '心动FM',
    '你画我猜',
    '竞速',
    '陪玩',
    '做任务'
  ];

  @override
  void onInit() {
    super.onInit();
  }

//==========================================================
// UI Events
//==========================================================
  onIconPress() {}
}
