import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import 'state.dart';

class SwiperListController extends GetxController {
  // PageController pageController = Get.find();

  ApiClient apiClient = ApiUtil.getApiClient();
  final state = SwiperListState();

  @override
  void onInit() async {
    BaseResultResponse<String> swiperResult = await apiClient.getSwiper();
    state.swiperMenus.value = swiperResult.data!;
    super.onInit();
  }

//==========================================================
// UI Events
//==========================================================
  onIconPress() {}
}
