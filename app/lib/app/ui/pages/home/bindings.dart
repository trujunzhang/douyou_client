import 'package:get/get.dart';
import 'package:dy_getx/app/ui/pages/commend/controller.dart';
import 'package:dy_getx/app/ui/pages/fishbar/controller.dart';
import 'package:dy_getx/app/ui/pages/focus/controller.dart';
import 'package:dy_getx/app/ui/pages/funny/controller.dart';
import 'package:dy_getx/app/ui/pages/page_in_develop/controller.dart';

import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<CommendController>(CommendController());
    Get.put<FunnyController>(FunnyController());
    Get.put<FishBarController>(FishBarController());
    Get.put<FocusController>(FocusController());
    Get.put<PageInDevelopController>(PageInDevelopController());
  }
}
