

import 'package:flutter/material.dart';
import 'package:projeto_final/styles/palette_style.dart';

class PaletteLight implements PaletteStyle{
  @override
  Color accent = const Color.fromRGBO(255, 111, 0, 50);

  @override
  Color backgroud = Colors.amber[800]!;

  @override
  Color primary =Color.fromARGB(255, 45, 189, 13)!;

  @override
  Color secondary = Color.fromARGB(255, 26, 153, 37)!;
  @override
  Color text = Color.fromARGB(221, 6, 83, 37);

  @override
  Color textSecondary = Colors.grey[100]!;
  
  @override
  Color primaryDark = const Color.fromARGB(255, 116, 28, 131);
  
}