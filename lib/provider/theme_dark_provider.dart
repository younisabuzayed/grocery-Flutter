import 'package:flutter/material.dart';
import 'package:grocery/services/theme_dark_prefs.dart';

class ThemeDarkProvider with ChangeNotifier
{
  final ThemeDarkPrefs darkThemePrefs = ThemeDarkPrefs();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value)
  {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}