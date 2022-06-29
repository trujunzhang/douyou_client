import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';

import 'animated_logo.dart';

int _headerAnimationTime = 250;

class LogoApp extends StatefulWidget {
  final direction;
  LogoApp(this.direction, {Key? key}) : super(key: key);

  _LogoAppState createState() => new _LogoAppState(direction);
}

class _LogoAppState extends State<LogoApp>
    with DYBase, SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final direction;

  _LogoAppState(this.direction);

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: _headerAnimationTime), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation, direction: direction);
  }
}
