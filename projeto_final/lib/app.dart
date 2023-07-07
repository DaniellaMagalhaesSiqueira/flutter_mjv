

import 'package:flutter/material.dart';
import 'package:projeto_final/providers/theme_provider.dart';
import 'package:projeto_final/styles/theme_styles.dart';
import 'package:provider/provider.dart';

import 'app_routes.dart';

class App extends StatefulWidget {
  const App({Key? key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  late ThemeProvider configTheme;


  @override
  Widget build(BuildContext context) {


    configTheme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Livro de Receitas',
      routes: AppRoutes.routes(),
      themeMode: configTheme.theme,
      theme: ThemeStyles.light,
      darkTheme: ThemeStyles.dark,
    );
  }
}