import 'package:flutter/material.dart';

import 'package:localizator/screens/index_screen.dart';
import 'package:localizator/screens/language_selection_screen.dart';
import 'package:localizator/screens/settings_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SettingsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case LanguageSelectionScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LanguageSelectionScreen());
      default:
        return MaterialPageRoute(builder: (_) => const IndexScreen());
    }
  }
}
