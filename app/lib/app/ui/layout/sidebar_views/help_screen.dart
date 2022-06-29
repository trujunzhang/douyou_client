import 'package:app_language/langs/l10n.dart';
import 'package:flutter/material.dart';
import 'package:my_plugin/my_plugin.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: MyAppBar(
          centerTitle: true,
          title: MyTitle(S.of(context).drawerMenuItemHelp),
          leadingType: AppBarBackType.None,
        ),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 16, right: 16),
          child: Image.asset('assets/images/helpImage.png'),
        ),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'How can we help you?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: const Text(
            'It looks like you are experiencing problems\nwith our sign up process. We are here to\nhelp so please get in touch with us',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: 140,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(4, 4),
                      blurRadius: 8.0),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Chat with Us',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
