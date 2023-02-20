import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:localizator/blocs/localization_bloc.dart';
import 'package:localizator/widgets/drawer.dart';
import 'package:localizator/widgets/locale_dropdown.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalizationBloc localizationBloc = BlocProvider.of<LocalizationBloc>(context);
    final appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalization.appName),
        actions: const [
          LocaleDropdown(),
        ],
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: CountryFlags.flag(localizationBloc.state.countryCode ?? 'US'),
            ),
            const SizedBox(height: 20),
            Text(
              appLocalization.greeting,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
