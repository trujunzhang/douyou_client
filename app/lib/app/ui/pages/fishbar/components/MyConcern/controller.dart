import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'state.dart';

class MyConcernController extends GetxController {
  // PageController pageController = Get.find();

  ApiClient apiClient = ApiUtil.getApiClient();

  List<String> myActive = ['鱼吧签到', '我的车队', '狼人杀'];
  GlobalKey hourTitleKey = GlobalKey();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final state = MyConcernState();

  @override
  void onInit() async{

    BaseResultResponse<Yuba> broadCastResponse = await apiClient.getYubaList();
    state.yubaList.value = broadCastResponse.data!;

    super.onInit();
  }

  // 下拉刷新
  void onRefresh() async {
    // rx.push('yubaList', data: 'refresh');
  }

  // 上拉加载
  void onLoading() async {
    // rx.push('yubaList', data: 'more');
  }
//==========================================================
// UI Events
//==========================================================
  onIconPress() {}
}
