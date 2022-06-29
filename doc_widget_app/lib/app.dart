import 'package:app_config/app_config.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:app_language/services/localization_service.dart';
import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:my_plugin/my_plugin.dart';

import 'app/routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfigs.appName,
      debugShowCheckedModeBanner: false,
      // defaultTransition: Transition.fade,
      // STYLE
      theme: AppLightTheme().buildTheme(context),
      darkTheme: AppDarkTheme().buildTheme(context),
      themeMode: ThemeService().theme,
      // TRANSLATIONS
      // locale: languageProviderRef.appLocale,
      // locale: window.locale,
      locale: LocalizationService().getCurrentLocale(),
      // translations will be displayed in that locale
      //List of all supported locales
      supportedLocales: S.delegate.supportedLocales,
      //These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: const [
        //Built-in localization of basic text for Material widgets (means those default Material widget such as alert dialog icon text)
        GlobalMaterialLocalizations.delegate,
        //Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      initialRoute: Routes.DOC_PREVIEW,
      getPages: AppPages.pages,
    );
  }
}
