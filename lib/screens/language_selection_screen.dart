import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:emoji_flag_converter/emoji_flag_converter.dart';

import 'package:localizator/blocs/localization_bloc.dart';
import 'package:localizator/localization/locales.dart';
import 'package:localizator/routing/routes.dart';

class LanguageSelectionScreen extends StatelessWidget {
  static const routeName = Routes.languageScreen;
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalizationBloc localizationBloc = BlocProvider.of<LocalizationBloc>(context);
    final appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalization.languageSelectionScreenTitle),
      ),
      body: ListView(
        children: Locales.locales.map((locale) => _buildLanguageOption(context, localizationBloc, locale)).toList(),
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, LocalizationBloc bloc, Locale locale) {
    return InkWell(
      onTap: () {
        bloc.updateLocale(locale);
        Navigator.pop(context);
      },
      child: ListTile(
        title: Text(Locales.getLanguage(locale)),
        trailing: Text(
          EmojiConverter.fromAlpha2CountryCode(locale.countryCode ?? Locales.eng.countryCode!),
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
