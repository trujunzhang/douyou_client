import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_rest/app_rest.dart';

class FocusState {
  Rx<bool> isAnimating = Rx<bool>(false);

  // Rx<double?> headerHeight = Rx<double?>(null);
  Rx<double> headerHeight = Rx<double>(0.0);
  Rx<double> headerOpacity = Rx<double>(1.0);

  Rx<Tween<double>?> opacityTween = Rx<Tween<double>?>(null);
  Rx<Tween<double>?> heightTween = Rx<Tween<double>?>(null);
}
