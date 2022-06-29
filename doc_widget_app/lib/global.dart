import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_plugin/my_plugin.dart';

/// 全局配置
class Global {
  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 是否 release
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init({Function? configFlavor}) async {
    WidgetsFlutterBinding.ensureInitialized();

    if (configFlavor != null) {
      configFlavor();
    }
  }
}
