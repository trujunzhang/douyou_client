import 'package:get/get.dart';

import 'controller.dart';

class FocusBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FocusController>(FocusController());
  }
}
