import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:my_plugin/my_plugin.dart';

import 'app_theme.dart';

class AppLightTheme implements BuildThemes {

  @override
  ThemeData buildTheme(BuildContext context) {
    final ThemeData lightTheme = FlexColorScheme.light(
      fontFamily: AppFonts.productFont,
      appBarElevation: 10,
      scaffoldBackground: const Color(0xffF5F5F1),
      // appBarStyle: FlexAppBarStyle.custom,
      colors: customFlexScheme.light,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    ).toTheme;
    return lightTheme;
  }

}
