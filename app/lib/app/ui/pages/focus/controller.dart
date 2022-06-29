import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import '../../../routes/params_helper.dart';

import 'state.dart';

class FocusController extends GetxController with DYBase {
  late double _headerHeightMax;
  set headerHeightMax(double value) => _headerHeightMax = value;

  PointerDownEvent? _pointDownEvent;

  final state = FocusState();

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
    super.onInit();
  }

  void onPointerMove(PointerMoveEvent e) {
    var nextHeight = state.headerHeight.value + e.delta.dy;

    if (nextHeight <= DYBase.statusBarHeight ||
        nextHeight >= _headerHeightMax) {
      return;
    }
    state.headerHeight.value = nextHeight;
    state.headerOpacity.value = (nextHeight - DYBase.statusBarHeight) / dp(55);
  }

  void onPointerDown(PointerDownEvent e) {
    _pointDownEvent = e;
  }

  void onPointerUp(PointerUpEvent e) {
    double? headerHeightNow = state.headerHeight.value;
    double headerOpacityNow = state.headerOpacity.value;
    double direction; // header动画方向，1-展开；0-收起

    // 快速滚动捕获，触摸松开间隔小于300ms直接根据滚动方向伸缩header
    if ((_pointDownEvent != null) &&
        (e.timeStamp.inMilliseconds -
                _pointDownEvent!.timeStamp.inMilliseconds <
            300)) {
      if (e.position.dy > _pointDownEvent!.position.dy) {
        direction = 1;
      } else {
        direction = 0;
      }
    }
    // 滚动松开时header高度一半以下收起
    else if (headerHeightNow < (_headerHeightMax / 2 + dp(15))) {
      direction = 0;
    }
    // 超过一半就完展开
    else {
      direction = 1;
    }

    if (direction == 0) {
      state.headerHeight.value = DYBase.statusBarHeight;
      state.headerOpacity.value = 0;
    } else {
      state.headerHeight.value = _headerHeightMax;
      state.headerOpacity.value = 1;
    }
    state.heightTween.value = Tween(
      begin: headerHeightNow,
      end: state.headerHeight.value,
    );
    state.opacityTween.value = Tween(
      begin: headerOpacityNow,
      end: state.headerOpacity.value,
    );
    state.isAnimating.value = true;
  }

  void animateEndCallBack() {
    state.isAnimating.value = false;
  }

//==========================================================
// UI Events
//==========================================================
  onIconPress() {}
}
