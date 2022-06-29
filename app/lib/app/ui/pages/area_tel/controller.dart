import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import '../../../routes/params_helper.dart';

import 'state.dart';

class AreaTelController extends GetxController with DYBase {
  ApiClient apiClient = ApiUtil.getApiClient();

  final state = AreaTelState();

  final letter = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  double letterListHeight = 0; // 字母列表的高度
  ScrollController scrollController = ScrollController();
  Map<String, GlobalKey> titlekey = {};
  // final Map _area = {};

  void getAreaList() async {
    AreaTel areaTelResponse = await apiClient.getAreaTel();
    state.areaTel.value = areaTelResponse;
    Map<String, List<String>?> data = areaTelResponse.getMap();
    var letterScrollTopMap = {};
    double height = 0;
    data.forEach((key, value) {
      if (value!.isEmpty) {
        return;
      }
      letterScrollTopMap[key] = height;
      var i = 0;
      do {
        height += dp(46.6);
        i++;
      } while (i < value.length + 1);
    });
    state.letterScrollTopMap.value = letterScrollTopMap;
    // setState(() {
    //   _area = data;
    //   _letterScrollTopMap = letterScrollTopMap;
    // });
  }

  @override
  void onInit() async {
    getAreaList();
    letterListHeight = MediaQueryData.fromWindow(window).size.height -
        DYBase.statusBarHeight -
        dp(50) -
        60;
    super.onInit();
  }

//==========================================================
// UI Events
//==========================================================

  // 触摸右侧字母栏滑动时，滚动到对应的字母地区集
  void onVerticalDragUpdate(details) {
    var eachHeight = letterListHeight / 26;
    if (details.localPosition.dy <= 0) {
      state.actLetter.value = 0;
    } else if (details.localPosition.dy >= letterListHeight) {
      state.actLetter.value = 25;
    } else {
      state.actLetter.value = details.localPosition.dy ~/ eachHeight;
    }
    int _actLetter = state.actLetter.value!;
    if (state.letterScrollTopMap.value![letter[_actLetter]] != null) {
      scrollController.jumpTo(min(
          state.letterScrollTopMap.value![letter[_actLetter]],
          scrollController.position.maxScrollExtent));
    }
  }

  // 触摸松手置空选中字母
  void onVerticalDragEnd(details) {
    state.actLetter.value = null;
  }

  void chooseArea(String country, String tel) {
    // rx.push('chooseArea', data: [country, tel] );
    // Navigator.of(context).pop();
    /* if (key.currentContext == null) {
      return;
    }
    RenderBox renderBox = key.currentContext.findRenderObject();
    Offset offset = renderBox.localToGlobal(Offset.zero);

    print('${offset.dx},${offset.dy}'); */
  }
}
