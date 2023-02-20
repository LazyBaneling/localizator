import 'package:flutter/material.dart';

class Locales {
  static getLanguage(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      default:
        return '...';
    }
  }

  static const eng = Locale('en', 'US');
  static const esp = Locale('es', 'MX');
  static const locales = [eng, esp];
}
