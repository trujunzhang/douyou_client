import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mix/mix.dart';
import 'package:my_plugin/my_plugin.dart';
import 'package:doc_widget/doc_widget.dart';

import 'index.dart';

class WidgetsPreviewPage extends GetWidget<WidgetsPreviewController> {
  const WidgetsPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: MyAppBar(
          title: const Text("Widgets Preview"),
          leading: const Box(),
        ),
        body: Obx(() => _buildBody(context)));
    // body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    List<ElementPreview> elements = controller.state.elements.value;
    if (elements.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
     return DocPreview(
      elements: elements,
      title: 'IEATTA',
      selectedIndex: controller.state.selectedIndex.value,
    );
  }
}
