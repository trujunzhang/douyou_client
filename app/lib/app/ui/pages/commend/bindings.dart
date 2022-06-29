import 'package:get/get.dart';

import 'controller.dart';

class CommendBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CommendController>(CommendController());
  }
}
