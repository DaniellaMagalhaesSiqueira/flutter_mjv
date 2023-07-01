import 'package:flutter/material.dart';

import '../app_routes.dart';

class MenuBarComponent extends StatelessWidget implements PreferredSizeWidget{


  final List<PopupMenuItem<String>> popItens = [
    PopupMenuItem(value: AppRoutes.initialRoute, child: const Text('Receitas')),
    PopupMenuItem(value: AppRoutes.formRoute, child: const Text('Cadastro'),),
  ];

  
  MenuBarComponent({super.key});


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  static Size get size => const Size.fromHeight(kToolbarHeight);


  void navegar(BuildContext context, String route){
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: const Text(
          'Livro de Receitas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading:
          PopupMenuButton(
            icon: const Icon(Icons.menu_sharp),
            onSelected: (value) {
              navegar(context, value);
            },
            itemBuilder: (BuildContext context) {
              return popItens;
            },
            offset: Offset.zero,
          ),
        
      );
  }
  

}