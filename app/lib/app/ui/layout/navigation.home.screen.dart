import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_drawer/draw_model.dart';
import 'custom_drawer/drawer_user_controller.dart';
import 'navigation.home.controller.dart';

class NavigationHomeScreen extends GetWidget<NavigationHomeController> {
  NavigationHomeController controller =
      Get.put<NavigationHomeController>(NavigationHomeController());

  NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      // color: AppColors.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          // backgroundColor: AppColors.nearlyWhite,
          body: DrawerUserController(
            screenIndex: controller.drawerIndex,
            drawerWidth: Get.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexData) {
              controller.changeIndex(drawerIndexData);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: controller.screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }
}
