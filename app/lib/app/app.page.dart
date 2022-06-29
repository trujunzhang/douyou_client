import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dy_getx/app/app.controller.dart';
import 'package:dy_getx/app/ui/layout/navigation.home.screen.dart';

import 'helpers/authentication_state.dart';
import 'ui/helpers/loading.page.dart';
import 'ui/pages/splash/splash_screen.dart';

class AppPage extends GetWidget<AppController> {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    // return GetX<AuthController>(builder: (AuthController authController) {
    //   if (authController.state is UnAuthenticated) {
    //     return SocialLoginScreen();
    //   }

    if (controller.isLoadWelcomePage.isTrue) {
      return SplashScreen();
    }

    // if (authController.state is Authenticated) {
    return NavigationHomeScreen();
    // }

    // return LoadingPage();
    // });
  }
}
