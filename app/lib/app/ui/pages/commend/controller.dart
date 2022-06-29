import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'state.dart';

class CommendController extends GetxController {
  ApiClient apiClient = ApiUtil.getApiClient();

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ScrollController scrollController = ScrollController(); // 首页整体滚动控制器

  final state = CommendState();

  @override
  void onInit() async {
    BaseResultResponse<String> navResult = await apiClient.getNav();
    state.navMenus.value = navResult.data!;

    LiveDataResponse liveResponse =
        await apiClient.getLiveData(page: state.liveListPage.value);
    state.liveList.value = liveResponse.data!.list!;
    super.onInit();
  }

  // 下拉刷新
  void onRefresh() async {
    // await dioManager.deleteByPrimaryKey(DYBase.baseUrl + API.liveData);

    // final counterBloc = BlocProvider.of<CounterBloc>(context);
    // final indexBloc = BlocProvider.of<IndexBloc>(context);

    // counterBloc.add(CounterEvent.reset);

    // var liveList = await DYservice.getLiveData(context, 1);
    // indexBloc.add(UpdateLiveData(liveList));

    refreshController.refreshCompleted();
  }

  // 上拉加载
  void onLoading() async {
    // final indexBloc = BlocProvider.of<IndexBloc>(context);

    // List liveData = BlocObj.index.state['liveData'];
    // var liveList = await DYservice.getLiveData(context);
    // liveData.addAll(liveList);
    // indexBloc.add(UpdateLiveData(liveData));

    state.liveListPage.value = state.liveListPage.value + 1;
    LiveDataResponse liveResponse =
        await apiClient.getLiveData(page: state.liveListPage.value);
    state.liveList.value = state.liveList.value + liveResponse.data!.list!;

    refreshController.loadComplete();
  }

//==========================================================
// UI Events
//==========================================================
  onIconPress() {}
}
