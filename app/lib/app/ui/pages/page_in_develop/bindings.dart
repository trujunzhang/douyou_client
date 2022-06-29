import 'package:get/get.dart';

import 'controller.dart';

class PageInDevelopBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PageInDevelopController>(PageInDevelopController());
  }
}
