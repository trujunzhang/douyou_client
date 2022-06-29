import 'package:get/get.dart';

import 'controller.dart';

class WidgetsPreviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<WidgetsPreviewController>(WidgetsPreviewController());
  }
}
