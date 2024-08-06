import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
