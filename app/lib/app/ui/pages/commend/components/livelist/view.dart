import 'dart:math';

import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';

import '../../controller.dart';
import 'widgets/index.dart';

class LiveList extends GetWidget<CommendController> with DYBase {
  const LiveList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
    // return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: const Color(0xfff1f5f6),
      child: Column(children: <Widget>[
        LiveTitle(liveList: controller.state.liveList.value),
        _listTableInfo(context),
      ]),
    );
  }

  // 直播列表详情
  Widget _listTableInfo(context) {
    List<LiveDatum> liveData = controller.state.liveList.value;
    final List<Widget> liveList = [];

    liveData.asMap().keys.forEach((index) {
      var item = liveData[index];
      var showKingTag = index % 5 == 0;
      liveList.add(LiveItem(
        item: item,
        showKingTag: showKingTag,
      ));
    });

    return Wrap(
      children: liveList,
    );
  }
}
