import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dy_getx/app/routes/params_helper.dart';
import 'package:dy_getx/app/ui/pages/setting/setting.page.dart';
import 'custom_drawer/draw_model.dart';
import 'sidebar_views/about/index.dart';
import 'sidebar_views/feedback_screen.dart';
import 'sidebar_views/help_screen.dart';
import 'sidebar_views/invite_friend_screen.dart';

class NavigationHomeController extends GetxController {
  Rx<Widget> _screenView = Rx<Widget>(SizedBox.shrink());
  Rx<DrawerIndex> _drawerIndex = Rx<DrawerIndex>(DrawerIndex.NONE);

  Widget get screenView => _screenView.value;

  DrawerIndex get drawerIndex => _drawerIndex.value;

  @override
  onInit() {
    changeIndex(DrawerIndex.HOME); // used
    // changeIndex(DrawerIndex.Profile); // test
    // changeIndex(DrawerIndex.Settings); // test
    // screenView = EditUserScreen(); // test
    // screenView = HelpScreen(); // test
    // screenView = InviteFriend(); // test
    // screenView = AboutScreen(); // test

    super.onInit();
  }

  @override
  void onReady() {}

//==========================================================
// UI Events
//==========================================================

  void changeIndex(DrawerIndex drawerIndexData) {
    if (drawerIndex != drawerIndexData) {
      _drawerIndex.value = drawerIndexData;
      if (drawerIndex == DrawerIndex.HOME) {
        // _screenView.value = AppHomeScreen();
      } else if (drawerIndex == DrawerIndex.Profile) {
        // AuthUserModel? authUserModel = authController.getAuthUserModel();
        // Map<String, String?> newParameters = {};
        // newParameters[ParamsHelper.ID] = authUserModel!.uid;
        // newParameters[ParamsHelper.MENU_ARROW] = ParamsHelper.MENU_ARROW_TAG;
        // Get.parameters = newParameters;
        // _screenView.value = UserProfilePage();
      } else if (drawerIndex == DrawerIndex.Settings) {
        _screenView.value = SettingScreen();
      } else if (drawerIndex == DrawerIndex.Help) {
        _screenView.value = const HelpScreen();
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        _screenView.value = const FeedbackScreen();
      } else if (drawerIndex == DrawerIndex.About) {
        _screenView.value = const AboutScreen();
      } else if (drawerIndex == DrawerIndex.Invite) {
        _screenView.value = const InviteFriend();
      } else {
        //do in your way......
      }
    }
  }
}
