import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

///
/// https://github.com/GorgeAntwan/flutter_multi_language_getx/blob/master/lib/localization_service.dart
///
class LocalizationService  {
  final _key = 'lng';
  // Default locale
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['English', 'Chinese'];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('zh', 'ZH'),
  ];

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);

    final box = GetStorage();
    box.write(_key, lang);

    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }

  Locale getCurrentLocale() {
    final box = GetStorage();
    Locale defaultLocale;

    if (box.read(_key) != null) {
      final locale =
      LocalizationService().getLocaleFromLanguage(box.read(_key));

      defaultLocale = locale;
    } else {
      defaultLocale = LocalizationService.locale;
    }

    return defaultLocale;
  }

  String getCurrentLang() {
    final box = GetStorage();

    return box.read(_key) != null ? box.read(_key) : "English";
  }
}