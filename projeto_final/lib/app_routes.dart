
import 'package:flutter/material.dart';
import 'package:projeto_final/pages/form_page.dart';
import 'package:projeto_final/pages/home_page.dart';
import 'package:projeto_final/pages/receitas_page.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String formRoute = 'form';
  static String recipesRoute = 'recipes';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (context) => const HomePage(),
      formRoute: (context) => const FormPage(),
      formRoute: (context) => const RecipesPage(),
    };
  }
}