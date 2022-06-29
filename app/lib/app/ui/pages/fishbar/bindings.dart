import 'package:get/get.dart';

import 'controller.dart';

class FishBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FishBarController>(FishBarController());
  }
}
