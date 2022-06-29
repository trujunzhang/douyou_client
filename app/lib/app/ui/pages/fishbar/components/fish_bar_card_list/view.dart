import 'package:app_rest/app_rest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../MyConcern/controller.dart';
import '../yubar_item/view.dart';

class FishBarCardList extends GetWidget<MyConcernController> {
  const FishBarCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
    // return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    List<Yuba> yuba = controller.state.yubaList.value;
    List<Widget> yubaList = [];

    yuba.asMap().forEach((i, item) {
      yubaList.add(YubaItem(index: i, item: item));
    });

    return Column(
      children: yubaList,
    );
  }
}
