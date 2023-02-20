import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:localizator/localization/locales.dart';

class LocalizationBloc extends Cubit<Locale> {
  LocalizationBloc() : super(Locales.eng);

  void updateLocale(Locale newLocale) {
    emit(newLocale);
  }
}
