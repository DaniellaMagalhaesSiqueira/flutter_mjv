

import 'package:flutter/material.dart';
import 'package:projeto_final/styles/palette_style.dart';

class PaletteDark implements PaletteStyle{
  @override
  Color accent = Color.fromARGB(255, 24, 213, 37);

  @override
  Color backgroud = Color.fromARGB(136, 17, 155, 15);

  @override
  Color primary =Colors.amber[800]!;

  @override
  Color secondary = Color.fromARGB(255, 24, 182, 35)!;
  @override
  Color text = Colors.black87;

  @override
  Color textSecondary = Colors.grey[300]!;

   @override
  Color primaryDark = const Color.fromARGB(255, 127, 27, 144);
  
}