import 'package:flutter/material.dart';
import 'package:projeto_final/components/icon_button_component.dart';
import 'package:projeto_final/components/spacer_component.dart';
import 'package:projeto_final/entities/category_enum.dart';
import 'package:projeto_final/pages/home/home_components/card_mini_image_component.dart';
import 'package:projeto_final/providers/recipe_provider.dart';
import 'package:projeto_final/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../app_routes.dart';
import '../../components/menu_bar_component.dart';
import '../../entities/recipe_entity.dart';
import 'home_components/form_search_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RecipeProvider store;
  late List<RecipeEntity> list;
  late ThemeProvider themeConfig;

  @override
  void initState() {
    super.initState();
  }

  void removeRecipe(int index, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.all(16),
            children: [
              const Text("Tem certeza que deseja apagar esse item?"),
              const SpacerComponent(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Não'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SpacerComponent(isHorizontal: true, size: 20),
                  ElevatedButton(
                    child: const Text('Sim'),
                    onPressed: () {
                      list.removeAt(index);
                      store.listRecipes = list;
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          );
        });
  }

  void select(int idx) {
    RecipeEntity selected = list.elementAt(idx);
    store.recipeSelected = selected;
    // Navigator.pushReplacementNamed(context, AppRoutes.formRoute, arguments: selected);
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<RecipeProvider>(context);

    list = store.filter;

    themeConfig = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: MenuBarComponent(
        isHome: true,
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              children: [
                Flexible(
                  child: FormSearchComponent(
                    list: list, 
                  ),
                ),
                ElevatedButton(
                  child: Text('Limpar Busca'),
                  onPressed: (){
                    store.filter = store.listRecipes;

                }),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: Row(
                    children: [
                      CardMiniImageComponent(image: list[index].image,),
                      Text(list[index].title),
                      const SpacerComponent(
                        isHorizontal: true,
                      ),
                      Text(CategoryStatic.getString(list[index].category)),
                      const SpacerComponent(
                        isHorizontal: true,
                        isFull: true,
                      ),
                      IconButtonComponent(
                        icon: Icons.delete,
                        onPressed: () {
                          removeRecipe(index, context);
                        },
                      ),
                      IconButtonComponent(
                        icon: Icons.edit,
                        onPressed: () {
                          select(index);
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.formRoute);
                        },
                      ),
                      IconButtonComponent(
                        icon: Icons.my_library_books,
                        onPressed: () {
                          select(index);
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.detailRoute);
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Escolha o Tema:'),
                SpacerComponent(isHorizontal: true, size: 20),
                Switch(
                  value: themeConfig.theme == ThemeMode.dark,
                  onChanged: (val) {
                    themeConfig.theme = val ? ThemeMode.dark : ThemeMode.light;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
