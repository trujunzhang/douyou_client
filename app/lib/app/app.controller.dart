import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_plugin/my_plugin.dart';

class AppController extends GetxController {
  // var for automatically start collecting data
  var isLoadWelcomePage = true.obs;

  @override
  onInit() {
    // Pass all uncaught errors to Crashlytics.
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    super.onInit();
  }

  @override
  void onReady() {
    startCountdownTimer();
  }

  // 展示欢迎页，倒计时1.5秒之后进入应用
  Future startCountdownTimer() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      isLoadWelcomePage.value = false;
    });
  }
}
