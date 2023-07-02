
import 'package:flutter/material.dart';
import 'package:projeto_final/pages/form/form_page.dart';
import 'package:projeto_final/pages/home/home_page.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String formRoute = '/form';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (context) => const HomePage(),
      formRoute: (context) => const FormPage(),
    };
  }
}