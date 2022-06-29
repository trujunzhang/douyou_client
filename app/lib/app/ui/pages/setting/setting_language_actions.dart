import 'package:app_language/langs/l10n.dart';
import 'package:app_language/services/localization_service.dart';
import 'package:flutter/material.dart';

enum LanguagesActions { english, chinese }

class SettingLanguageActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale _appCurrentLocale = LocalizationService().getCurrentLocale();

    return PopupMenuButton<LanguagesActions>(
      icon: Icon(Icons.language),
      onSelected: (LanguagesActions result) {
        switch (result) {
          case LanguagesActions.english:
            {
              LocalizationService().changeLocale("English");
              break;
            }
          case LanguagesActions.chinese:
            {
              LocalizationService().changeLocale("Chinese");
              break;
            }
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<LanguagesActions>>[
        PopupMenuItem<LanguagesActions>(
          value: LanguagesActions.english,
          enabled: _appCurrentLocale.languageCode == "en" ? false : true,
          child: Text(S.of(context).settingPopUpToggleEnglish),
        ),
        PopupMenuItem<LanguagesActions>(
          value: LanguagesActions.chinese,
          enabled: _appCurrentLocale.languageCode == "zh" ? false : true,
          child: Text(S.of(context).settingPopUpToggleChinese),
        ),
      ],
    );
  }
}
