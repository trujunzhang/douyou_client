import 'package:get/get.dart';

import 'controller.dart';

class AreaTelBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AreaTelController>(AreaTelController());
  }
}
