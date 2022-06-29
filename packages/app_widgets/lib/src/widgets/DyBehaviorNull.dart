import 'dart:io';

import 'package:flutter/material.dart';


// 去除安卓滚动视图水波纹
class DyBehaviorNull extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildViewportChrome(context,child,axisDirection);
    }
  }
}