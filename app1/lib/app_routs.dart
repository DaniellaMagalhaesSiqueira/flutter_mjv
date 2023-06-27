

import 'package:app1/pages/detalhe/detalhe_page.dart';
import 'package:app1/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';


class Argumentos {
  final int? index;

  Argumentos({this.index});
}


class AppRoutes {

  static String initialRoute = '/';
  static String detalhe = '/detalhe';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (context) => const HomePage(),
      // DetalhePage.routName: (context) => DetalhePage(),
      detalhe: (context) => const DetalhePage(),
    };
  }
}