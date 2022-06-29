import 'package:app_language/langs/l10n.dart';
import 'package:flutter/material.dart';
import 'package:dy_getx/app/ui/widgets/SignoutDialog.dart';
import 'package:my_plugin/my_plugin.dart';

import 'setting_language_actions.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey[300],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: MyAppBar(
          centerTitle: true,
          title: MyTitle(S.of(context).drawerMenuItemSettings),
          leadingType: AppBarBackType.None,
        ),
        body: _buildLayoutSection(context));
  }

  Widget _buildLayoutSection(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(S.of(context).settingThemeListTitle),
          subtitle: Text(S.of(context).settingThemeListSubTitle),
          trailing: Switch(
            activeColor: Theme.of(context).appBarTheme.color,
            activeTrackColor: Theme.of(context).textTheme.headline6!.color,
            value: ThemeService().loadThemeFromBox(),
            onChanged: (booleanValue) {
              ThemeService().switchTheme();
            },
          ),
        ),
        ListTile(
          title: Text(S.of(context).settingLanguageListTitle),
          subtitle: Text(S.of(context).settingLanguageListSubTitle),
          trailing: SettingLanguageActions(),
        ),
        ListTile(
          title: Text(S.of(context).settingLogoutListTitle),
          subtitle: Text(S.of(context).settingLogoutListSubTitle),
          trailing: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                // showSignOutDialog(context);
              },
              child: Text(S.of(context).settingLogoutButton)),
        )
      ],
    );
  }
}
