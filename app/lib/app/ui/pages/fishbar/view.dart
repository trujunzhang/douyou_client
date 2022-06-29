import 'package:app_config/app_config.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';

import 'components/index.dart';
import 'index.dart';
import 'widgets/index.dart';

class FishBarPage extends GetWidget<FishBarController> with DYBase {
  const FishBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        // appBar: MyAppBar(
        //   centerTitle: true,
        //   // title: MyTitle(S.of(context).drawerMenuItemAbout),
        //   leadingType: AppBarBackType.None,
        // ),
        body: Obx(() => _buildBody(context)));
    // body: _buildBody(context));
  }

  List<Widget> _nav() {
    int _navActIndex = controller.state.navActIndex.value;
    return controller.navList
        .asMap()
        .map((i, name) {
          return MapEntry(
            i,
            GestureDetector(
              onTap: () {
                controller.state.navActIndex.value = i;
              },
              child: Container(
                width: dp(70),
                height: dp(55),
                color: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: _navActIndex == i ? 20 : 16,
                            fontWeight: FontWeight.bold,
                            color: _navActIndex == i
                                ? DYBase.defaultColor
                                : const Color(0xff333333)),
                      ),
                    ),
                    _navActIndex == i
                        ? Positioned(
                            bottom: 0,
                            left: dp(35.0 - 4),
                            child: Container(
                              width: dp(8),
                              height: dp(4),
                              decoration: BoxDecoration(
                                color: DYBase.defaultColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(dp(2)),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        })
        .values
        .toList();
  }

  Widget _view() {
    int _navActIndex = controller.state.navActIndex.value;
    MaterialColor? color;
    switch (_navActIndex) {
      case 0:
        return NotificationListener(
          onNotification: (Notification notification) {
            switch (notification.runtimeType) {
              case ScrollUpdateNotification:
                // if (notification?.dragDetails != null) {
                //   _onVerticalDragUpdate(notification.dragDetails);
                // }
                break;
            }
            return true;
          },
          // child: Container(),
          child: MyConcern(headerAnimated: controller.headerAnimated),
        );
      case 1:
        color = Colors.lightGreen;
        break;
      case 2:
        color = Colors.pink;
        break;
    }
    return ScrollConfiguration(
      behavior: DyBehaviorNull(),
      child: ListView(
        key: ObjectKey(_navActIndex),
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 900,
            color: color,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    int? _direction = controller.state.direction.value;
    return GestureDetector(
      onVerticalDragUpdate: controller.onVerticalDragUpdate,
      child: Column(
        children: <Widget>[
          _direction == null
              ? const DyHeader()
              : LogoApp(_direction, key: ObjectKey(_direction)),
          Container(
            color: Colors.transparent,
            child: Row(
              children: _nav(),
            ),
          ),
          Expanded(
            flex: 1,
            child: _view(),
          ),
        ],
      ),
    );
  }
}
