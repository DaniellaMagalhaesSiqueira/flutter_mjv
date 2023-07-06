import 'package:flutter/material.dart';
import 'package:projeto_final/components/icon_button_component.dart';
import 'package:projeto_final/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

import '../app_routes.dart';

class MenuBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;

  final List<PopupMenuItem<String>> popItens = [
    PopupMenuItem(value: AppRoutes.initialRoute, child: const Text('Receitas')),
    PopupMenuItem(
      value: AppRoutes.formRoute,
      child: const Text('Cadastro'),
    ),
  ];

  MenuBarComponent({super.key, required this.isHome});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  static Size get size => const Size.fromHeight(kToolbarHeight);

  void navegar(BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    // String? currentRoute = ModalRoute.of(context)?.settings.name;
    // if(currentRoute == AppRoutes.initialRoute){
    //   isHome = true;
    // }

    if (isHome) {}
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Livro de Receitas',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: isHome
          ? PopupMenuButton(
              icon: const Icon(Icons.menu_sharp),
              onSelected: (value) {
                navegar(context, value);
              },
              itemBuilder: (BuildContext context) {
                return popItens;
              },
              offset: Offset.zero,
            )
          : IconButtonComponent(
              icon: Icons.arrow_circle_left_outlined,
              onPressed: () {
                final store = Provider.of<RecipeProvider>(context, listen: false);
                store.recipeSelected = null;
                navegar(context, AppRoutes.initialRoute);
              },
            ),
    );
  }
}
