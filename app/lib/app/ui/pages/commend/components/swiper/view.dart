import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';

import 'index.dart';

class SwiperList extends StatefulWidget {
  const SwiperList({Key? key}) : super(key: key);

  @override
  _SwiperListState createState() => _SwiperListState();
}

class _SwiperListState extends State<SwiperList> with DYBase {
  SwiperListController controller =
      Get.put<SwiperListController>(SwiperListController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
    // return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(dp(16)),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(dp(10)),
            ),
            child: SizedBox(
              height: dp(130),
              child: _waitSwiperData(),
            ),
          ),
        );
  }

  Widget _waitSwiperData() {
    List swiperPic = controller.state.swiperMenus.value;
    if (swiperPic.isEmpty) {
      return Image.asset(
        'assets/images/shayuniang.png',
      );
    } else if (swiperPic.isNotEmpty) {
      return Swiper(
        itemBuilder: (BuildContext context, int index) => CachedNetworkImage(
          imageUrl: swiperPic[index],
          placeholder: (context, url) => Image.asset(
            'assets/images/shayuniang.png',
            fit: BoxFit.contain,
          ),
          fit: BoxFit.cover,
        ),
        itemCount: swiperPic.length,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              size: dp(6),
              activeSize: dp(9),
              activeColor: DYBase.defaultColor,
            ),
            margin: EdgeInsets.only(
              right: dp(10),
              bottom: dp(5),
            ),
            alignment: Alignment.bottomRight),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('Swiper pic $index click'),
      );
    }

    return Gaps.empty;
  }

  @override
  void dispose() {
    Get.delete<SwiperListController>();
    super.dispose();
  }
}
