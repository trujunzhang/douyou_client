import 'package:app_config/app_config.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';

import 'index.dart';
import 'widgets/index.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({Key? key}) : super(key: key);

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> with DYBase {
  FocusController controller = Get.find();

  @override
  void initState() {
    controller.headerHeightMax = DYBase.statusBarHeight + dp(55);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        // appBar: MyAppBar(
        //   centerTitle: true,
        //   // title: MyTitle(S.of(context).drawerMenuItemAbout),
        //   leadingType: AppBarBackType.None,
        // ),
        // body: Obx(() => _buildBody(context)));
        body: _buildBody(context));
  }

  List<Widget> _colorBlock() {
    var res = <Widget>[];
    for (var i = 0; i < 8; i++) {
      res.add(Container(
        margin: EdgeInsets.only(top: dp(20), left: dp(20), right: dp(20)),
        height: dp(120),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(width: dp(2), color: DYBase.defaultColor),
        ),
        child: Center(
          child: Text(
            (i + 1).toString(),
            style: TextStyle(
              color: DYBase.defaultColor,
              fontSize: dp(38),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ));
    }

    return res;
  }

  Widget _buildBody(BuildContext context) {
    bool _isAnimating = controller.state.isAnimating.value;
    return Listener(
      onPointerDown: controller.onPointerDown,
      onPointerUp: controller.onPointerUp,
      onPointerMove: controller.onPointerMove,
      child: Column(
        children: <Widget>[
          _isAnimating
              ? AnimatedHeader(
                  key: ObjectKey(_isAnimating),
                  opacityTween: controller.state.opacityTween.value!,
                  heightTween: controller.state.heightTween.value!,
                  cb: controller.animateEndCallBack,
                )
              : DyHeader(
                  height: controller.state.headerHeight.value,
                  opacity: controller.state.headerOpacity.value,
                ),
          Expanded(
            flex: 1,
            child: ScrollConfiguration(
              behavior: DyBehaviorNull(),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                children: _colorBlock(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
