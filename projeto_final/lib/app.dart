

import 'package:flutter/material.dart';
import 'package:projeto_final/pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Livro de Receitas',
      theme: ThemeData(
        primaryColor: Colors.amber[600],
        appBarTheme: AppBarTheme(color: Colors.amber[600]),
        primaryIconTheme: IconThemeData(color: Colors.amber[800]),
        iconTheme: IconThemeData(color: Colors.amber[800]),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: Colors.amber[800], unselectedItemColor: Colors.amber[400],),
      ),
      home: const HomePage(),
    );
  }
}