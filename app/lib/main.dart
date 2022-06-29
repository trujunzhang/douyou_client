import 'dart:async';

import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:my_plugin/my_plugin.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'global.dart';

void main() => Global.init(configFlavor: () {
      FlavorHelper.config({
        FlavorHelper.kAppbarHeight: AppConfigs.appbarHeight,
      }, develop: false);
    }).then((e) =>
        // Run the app
        runZonedGuarded(() {
          // SentryService.instance.initialize();
          runApp(const OKToast(
              child: MyApp(),
              backgroundColor: Colors.black54,
              textPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              radius: 20.0,
              position: ToastPosition.bottom));
        }, (exception, stackTrace) async {
          // await Sentry.captureException(exception, stackTrace: stackTrace);
        }));
