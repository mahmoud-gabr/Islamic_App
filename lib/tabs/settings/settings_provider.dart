import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languge = 'en';
  bool get isDark => themeMode == ThemeMode.dark;
  String get backgroundImagePath =>
      isDark ? 'assets/images/dark_bg.png' : 'assets/images/bg.png';
  List<String> get sebhaImages => isDark
      ? [
          'assets/images/head_sebha_dark.png',
          'assets/images/body_sebha_dark.png'
        ]
      : [
          'assets/images/head_sebha_logo.png',
          'assets/images/body_sebha_logo.png',
        ];

  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changLanguge(String selectedLanguage) {
    languge = selectedLanguage;
    notifyListeners();
  }
}
