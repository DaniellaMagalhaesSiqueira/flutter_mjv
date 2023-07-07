


import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeMode _theme = ThemeMode.light;

  ThemeMode get theme => _theme;

  set theme(ThemeMode value){
    _theme = value;
    notifyListeners();
  }
}