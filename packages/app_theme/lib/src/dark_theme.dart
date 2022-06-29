import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:app_config/app_config.dart';
import 'package:my_plugin/my_plugin.dart';

import 'app_theme.dart';

class AppDarkTheme implements BuildThemes {
  @override
  ThemeData buildTheme(BuildContext context) {
    final ThemeData darkTheme = FlexColorScheme.dark(
      fontFamily: AppFonts.productFont,
      appBarElevation: 10,
      // appBarStyle: FlexAppBarStyle.custom,
      colors: customFlexScheme.dark,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    ).toTheme;
    return darkTheme;
  }
}
