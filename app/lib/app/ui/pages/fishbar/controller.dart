import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import '../../../routes/params_helper.dart';

import 'state.dart';

int _headerAnimationTime = 250;

class FishBarController extends GetxController {
  List<String> navList = ['我的', '广场', '找吧'];
  bool _duringAnimation = false;
  late AnimationController controller;

  final state = FishBarState();

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
    super.onInit();
  }

  void headerAnimated(int direction) {
    if (_duringAnimation) {
      return;
    }
    _duringAnimation = true;

    state.direction.value = direction;

    Timer(Duration(milliseconds: _headerAnimationTime), () {
      _duringAnimation = false;
    });
  }

  // 通过监听手势触发头部动画的下拉与收起
  void onVerticalDragUpdate(DragUpdateDetails details) {
    if (details.delta.dy >= 1.0) {
      headerAnimated(-1); // 向下滑动 ↓
    } else if (details.delta.dy <= -1.0 && !_duringAnimation) {
      headerAnimated(1); // 向上滑动 ↑
    }
  }

//==========================================================
// UI Events
//==========================================================
  onIconPress() {}
}
