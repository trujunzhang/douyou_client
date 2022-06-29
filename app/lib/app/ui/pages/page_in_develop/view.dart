import 'package:app_config/app_config.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_plugin/my_plugin.dart';

import 'index.dart';

class PageInDevelopPage extends GetWidget<PageInDevelopController> with DYBase {
  const PageInDevelopPage({Key? key}) : super(key: key);

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
            title: Text(controller.appBarTitle),
            backgroundColor: DYBase.defaultColor,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Color(0xffff8633), Color(0xffff6634)],
                ),
              ),
            ),
            actions: const <Widget>[
              DyHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ],
            systemOverlayStyle: SystemUiOverlayStyle.light,
            toolbarTextStyle: const TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ).bodyText2,
            titleTextStyle: const TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ).headline6,
          ),
          preferredSize: Size.fromHeight(dp(55)),
        ),
        // body: Obx(() => _buildBody(context)));
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: RaisedButton(
        textColor: Colors.white,
        color: DYBase.defaultColor,
        child: const Text('打开测试页面'),
        onPressed: () {
          controller.openTestPage(context);
        },
      ),
    );
  }
}
