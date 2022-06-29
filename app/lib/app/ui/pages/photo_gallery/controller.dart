import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import '../../../routes/params_helper.dart';

import 'state.dart';

class PhotoGalleryController extends GetxController {
  final state = PhotoGalleryState();

  @override
  void onInit() {
    super.onInit();
  }

//==========================================================
// UI Events
//==========================================================

  void onPageChanged(int index) {
    // setState(() {
    state.currentIndex.value = index;
    // });
  }

  onIconPress() {}
}
