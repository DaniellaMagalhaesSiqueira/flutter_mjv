import 'package:flutter/material.dart';
import 'package:projeto_final/app_routes.dart';

import '../../components/menu_bar_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //página selecionada
  late int page;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBarComponent(),
      body: Text('Body Content'),
    );
  }
}
