

import 'package:flutter/material.dart';
import 'package:projeto_final/styles/palette_style.dart';

class PaletteVegan implements PaletteStyle{
  @override
  Color accent = Colors.tealAccent[400]!;

  @override
  Color backgroud = Colors.teal[50]!;

  @override
  Color primary = Colors.teal[700]!;

  @override
  Color secondary = Colors.teal[300]!;

  @override
  Color text = Colors.black87;

  @override
  Color textSecondary =  Colors.teal[100]!;
  
}