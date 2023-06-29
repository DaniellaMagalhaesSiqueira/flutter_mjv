

import 'package:app1/styles/pallete_style.dart';
import 'package:flutter/material.dart';

class PalleteDark implements PalleteStyle{
  
  @override
  Color accent = Colors.amber[800]!;
  
  @override
  Color background = Colors.grey[800]!;
  
  @override
  Color backgroundDark = Colors.grey[900]!;
  
  @override
  Color error = Colors.red;
  
  @override
  Color primary = const Color.fromARGB(255, 193, 43, 219);
  
  @override
  Color secondary = Colors.grey[400]!;
  
  @override
  Color succes = Colors.green[800]!;
  
  @override
  Color text = Colors.grey[50]!;
  
  @override
  Color textSecondary = Colors.white;
  
  @override
  Color warning = Colors.yellow[900]!;
  
  @override
  Color white = Colors.white;
  
  @override
  Color primaryDark = const Color.fromARGB(255, 127, 27, 144);
}