import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doc_widget/doc_widget.dart';

import 'doc_widget_helper.dart';
import 'state.dart';

class WidgetsPreviewController extends GetxController {
  final state = WidgetsPreviewState();
  DocWidgetHelper docWidgetHelper = DocWidgetHelper();

  @override
  void onInit() async {
    await docWidgetHelper.setup();
    _buildElementsPreviewList();
    super.onInit();
  }

  void _buildElementsPreviewList() {
    // state.selectedIndex.value = 1;
    state.elements.value = [
      docWidgetHelper.button,
    ];
  }
}
