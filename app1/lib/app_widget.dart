
import 'package:app1/providers/config_provider.dart';
import 'package:app1/styles/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_routs.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late ConfigProvider storeConfig;

  @override
  Widget build(BuildContext context) {
    storeConfig = Provider.of<ConfigProvider>(context);
    return MaterialApp(
      title: 'School',
      routes: AppRoutes.routes(),
      themeMode: storeConfig.tema,
      theme: MyTheme.claro,
      darkTheme: MyTheme.escuro,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
   
//     return Container(
//       color: Colors.red,
//       child: const Text('Meu app'),
//     );
    
//   }
// }