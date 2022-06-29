import 'package:get/get.dart';

import 'controller.dart';

class FunnyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FunnyController>(FunnyController());
  }
}
