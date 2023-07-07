

import 'package:flutter/material.dart';
import 'package:projeto_final/styles/palette_dark.dart';
import 'package:projeto_final/styles/palette_light.dart';

class ThemeStyles {
  static final PaletteDark _dark = PaletteDark();
  static final PaletteLight _light = PaletteLight();


  static final ThemeData light = ThemeData.light().copyWith(
    colorScheme: ThemeData.light().colorScheme.copyWith(

       primary: _light.primary,
          secondary: _light.accent,
          background: _light.backgroud,
    ),
    primaryColor: _light.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: _light.backgroud,
      titleTextStyle: TextStyle(
        color: _light.textSecondary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
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


   static final ThemeData dark = ThemeData().copyWith(
    colorScheme: ThemeData.dark().colorScheme.copyWith(
      primary: _dark.primary,
      secondary: _dark.accent,
      background: _dark.backgroud,
    ),
    primaryColor: _dark.primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: _dark.backgroud,
      titleTextStyle: TextStyle(
        color: _dark.text,
        fontWeight: FontWeight.bold,
        fontSize: 20,
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

   );


}