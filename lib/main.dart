import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:localizator/blocs/localization_bloc.dart';
import 'package:localizator/localization/locales.dart';
import 'package:localizator/screens/index_screen.dart';
import 'package:localizator/routing/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalizationBloc>(
      create: (_) => LocalizationBloc(),
      child: BlocBuilder<LocalizationBloc, Locale>(
        builder: (context, state) {
          return MaterialApp(
            locale: BlocProvider.of<LocalizationBloc>(context).state,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: Locales.locales,
            home: const IndexScreen(),
            onGenerateRoute: router.Router.generateRoute,
            theme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
