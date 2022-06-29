import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_plugin/my_plugin.dart';

import 'index.dart';

class AreaTelPage extends GetWidget<AreaTelController> with DYBase {
  const AreaTelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        // appBar: MyAppBar(
        //   centerTitle: true,
        //   // title: MyTitle(S.of(context).drawerMenuItemAbout),
        //   leadingType: AppBarBackType.None,
        // ),
        appBar: PreferredSize(
          child: AppBar(
            title: const Text('选择国家和地区代码'),
            titleSpacing: 0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Image.asset(
                    'assets/images/back.webp',
                    width: dp(8),
                  ),
                ),
              ),
            ),
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          preferredSize: Size.fromHeight(dp(55)),
        ),
        backgroundColor: const Color(0xffeeeeee),
        body: Obx(() => _buildBody(context)));
    // body: _buildBody(context));
  }

  List<Widget> _areaList() {
    if (controller.state.areaTel.value == null) {
      return [const SizedBox()];
    }
    Map<String, List<String>?> _area = controller.state.areaTel.value!.getMap();
    List<Widget> result = [];
    _area.forEach((key, value) {
      if (value!.isEmpty) {
        return;
      }
      GlobalKey _key = GlobalKey();
      controller.titlekey[key] = _key;
      result.add(Container(
        key: _key,
        margin: EdgeInsets.only(left: dp(6), right: dp(6)),
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: const Color(0xff999999), width: dp(.6))),
        ),
        child: Container(
          height: dp(46),
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: dp(10)),
                child: Text(
                  key,
                  style: const TextStyle(
                    color: Color(0xff999999),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
      for (var item in value) {
        var _item = item.split('-');
        var enName = _item[0];
        var cnName = _item[1];
        var tel = _item[2];
        result.add(GestureDetector(
          onTap: () => controller.chooseArea(cnName, tel),
          child: Container(
            margin: EdgeInsets.only(left: dp(6), right: dp(6)),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: const Color(0xff999999), width: dp(.6))),
            ),
            child: Container(
              height: dp(46),
              color: Colors.transparent,
              child: Row(
                children: <Widget>[
                  Text(
                    '$cnName($enName)',
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ));
      }
    });

    return result;
  }

  List<Widget> _letterList() {
    if (controller.state.areaTel.value == null) {
      return [const SizedBox()];
    }
    Map<String, List<String>?> _area = controller.state.areaTel.value!.getMap();
    int? _actLetter = controller.state.actLetter.value;
    List config = _area
        .map((key, value) {
          return MapEntry(key, {
            'key': key,
          });
        })
        .values
        .toList();

    return config
        .asMap()
        .map((i, item) {
          var baseColor = _actLetter == null ? Colors.black : Colors.white;
          return MapEntry(
              i,
              SizedBox(
                height: controller.letterListHeight / 26,
                child: Center(
                  child: Text(
                    item['key'],
                    style: TextStyle(
                      color: i == _actLetter ? DYBase.defaultColor : baseColor,
                      fontSize: i == _actLetter ? 12.0 : 8.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ));
        })
        .values
        .toList();
  }

  Widget _buildBody(BuildContext context) {
    int? _actLetter = controller.state.actLetter.value;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        ListView(
          controller: controller.scrollController,
          padding: const EdgeInsets.all(0),
          children: [
            ..._areaList(),
          ],
        ),
        Positioned(
          right: 0,
          child: Container(
            color: _actLetter == null
                ? Colors.transparent
                : const Color.fromARGB(90, 0, 0, 0),
            width: dp(30),
            height: controller.letterListHeight + 60,
            child: Center(
              child: GestureDetector(
                onVerticalDragEnd: controller.onVerticalDragEnd,
                onVerticalDragDown: controller.onVerticalDragUpdate,
                onVerticalDragUpdate: controller.onVerticalDragUpdate,
                child: Container(
                  color: Colors.transparent,
                  height: controller.letterListHeight,
                  child: Column(
                    children: _letterList(),
                  ),
                ),
              ),
            ),
          ),
        ),
        _actLetter != null
            ? Positioned(
                child: Container(
                  height: dp(120),
                  width: dp(120),
                  decoration: const BoxDecoration(
                    color: DYBase.defaultColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      controller.letter[_actLetter],
                      style: TextStyle(
                        fontSize: dp(60),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
