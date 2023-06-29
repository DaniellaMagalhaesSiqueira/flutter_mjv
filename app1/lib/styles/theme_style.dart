
import 'dart:js_util';

import 'package:app1/styles/palette_dark.dart';
import 'package:app1/styles/pallete_light.dart';
import 'package:app1/styles/pallete_style.dart';
import 'package:flutter/material.dart';

class MyTheme {

  static final PalleteLight _light = PalleteLight();
  static final PalleteDark _dark = PalleteDark();

  // static final PalleteStyle _cor = PalleteDark();

  static final ThemeData claro = ThemeData.light().copyWith(
    colorScheme: ThemeData.light().colorScheme.copyWith(
      primary: _light.primary,
      secondary: _light.secondary,
      background: _light.background,
      error: _light.error,
    ),
    primaryColor: _light.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: _light.primaryDark,
      titleTextStyle: TextStyle(
        color: _light.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => _light.primary ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.selected) ? _light.primary : _light.secondary;
      }),
      trackColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.selected) ? _light.primary : _light.secondary;
      }),
    ),
  );

  static final ThemeData escuro = ThemeData.dark().copyWith(
    colorScheme: ThemeData.dark().colorScheme.copyWith(
       secondary: _dark.accent,
    ),
    primaryColor: _dark.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: _dark.primaryDark,
      titleTextStyle: TextStyle(
        color: _dark.text,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
      cardTheme: CardTheme(
        color: MaterialStateColor.resolveWith((states) => _dark.primary),
      ),
      dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
          color: _dark.text,
        ),
      ),
      switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.selected) ? _dark.primary : _dark.secondary;
      }),
      trackColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.selected) ? _dark.primary : _dark.secondary;
      }),
    ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ButtonStyle(
      //     backgroundColor: MaterialStateColor.resolveWith((states) => _dark.primaryDark),
      //   ),
      // ),
      // iconButtonTheme: IconButtonThemeData(
      //   style: ButtonStyle(
      //     foregroundColor: MaterialStateColor.resolveWith((states) {
      //       return states.contains(MaterialState.focused) ? _dark.warning : _dark.secondary;
      //     }),
      //   ),
      // ),
  );

}