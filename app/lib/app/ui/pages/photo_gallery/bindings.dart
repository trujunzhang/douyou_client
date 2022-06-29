import 'package:get/get.dart';

import 'controller.dart';

class PhotoGalleryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PhotoGalleryController>(PhotoGalleryController());
  }
}
