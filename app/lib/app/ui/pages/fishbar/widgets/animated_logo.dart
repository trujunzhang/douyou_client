import 'package:app_config/app_config.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:flutter/material.dart';

// 头部动画组件
class AnimatedLogo extends AnimatedWidget with DYBase {
  late Tween<double> _opacityTween, _heightTween;
  late double height, opacity, beginH, beginO, endH, endO;
  final direction;

  AnimatedLogo({
    Key? key,
    required Animation<double> animation,
    this.direction,
  }) : super(key: key, listenable: animation) {
    beginH = direction == -1
        ? DYBase.statusBarHeight
        : DYBase.statusBarHeight + dp(55);
    endH = direction == -1
        ? DYBase.statusBarHeight + dp(55)
        : DYBase.statusBarHeight;
    beginO = direction == -1 ? 0 : 1;
    endO = direction == -1 ? 1 : 0;
    _heightTween = Tween(
      begin: beginH,
      end: endH,
    );
    _opacityTween = Tween(
      begin: beginO,
      end: endO,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return DyHeader(
      height: _heightTween.evaluate(animation),
      opacity: _opacityTween.evaluate(animation),
    );
  }
}
