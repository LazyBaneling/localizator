import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LocalizationBloc extends Cubit<Locale> {
  LocalizationBloc() : super(const Locale('en'));

  void updateLocale(Locale newLocale) {
    emit(newLocale);
  }
}
