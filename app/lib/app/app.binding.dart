import 'package:get/get.dart';
import 'package:dy_getx/app/app.controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController());
  }
}
