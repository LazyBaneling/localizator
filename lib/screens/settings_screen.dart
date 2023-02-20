import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:localizator/routing/routes.dart';
import 'package:localizator/screens/language_selection_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = Routes.settingsScreen;
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsScreenTitle),
      ),
      body: ListView(
        children: <Widget>[
          _buildLanguageSelection(context),
        ],
      ),
    );
  }

  Widget _buildLanguageSelection(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, LanguageSelectionScreen.routeName);
      },
      child: ListTile(
        title: Text(AppLocalizations.of(context)!.languageSelectionScreenTitle),
        subtitle: Text(AppLocalizations.of(context)!.languageName),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
