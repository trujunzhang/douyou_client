import 'package:app_models/app_models.dart';
import 'package:dy_getx/app/ui/pages/photo_gallery/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import 'state.dart';

class YubaItemController extends GetxController {
  // PageController pageController = Get.find();

  final state = YubaItemState();

//==========================================================
// UI Events
//==========================================================

  void starNews(index) {
    // setState(() {
    //   yuba[index]['isAgree'] = !yuba[index]['isAgree'];
    // });
  }

  void showCardOption() {
    // RenderBox box = widget.hourTitleKey.currentContext.findRenderObject();
    // Offset offset = box.localToGlobal(Offset.zero);
  }

  // 图片预览gallery
  void showPhotoGallery(BuildContext context, List pic,
      {int index = 0, required String tag}) {
    var galleryItems = pic
        .asMap()
        .map((i, item) {
          return MapEntry(
              i,
              GalleryItem(
                id: tag,
                resource: item,
              ));
        })
        .values
        .toList();
    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation<double> animation, Animation secondaryAnimation) {
      return FadeTransition(
        opacity: animation,
        child: GalleryPhotoViewWrapper(
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
        ),
      );
    }));
  }

  onIconPress() {}
}
