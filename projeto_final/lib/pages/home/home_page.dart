import 'package:flutter/material.dart';
import 'package:projeto_final/components/icon_button_component.dart';
import 'package:projeto_final/components/spacer_component.dart';
import 'package:projeto_final/entities/category_enum.dart';
import 'package:projeto_final/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

import '../../components/menu_bar_component.dart';
import '../../entities/recipe_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<RecipeEntity> list;
  final recipes = [
    RecipeEntity(
        uuid: 'uuid',
        title: 'Peru de Natal',
        ingredients: ['ingredient1', 'ingredient2'],
        description: 'description',
        category: CategoryEnum.birds),
    // RecipeEntity(
    //     uuid: 'uuid2',
    //     title: 'Caldo Verde',
    //     ingredients: ['ingredient1', 'ingredient2'],
    //     description: 'description',
    //     category: CategoryEnum.soups),
    // RecipeEntity(
    //     uuid: 'uuid3',
    //     title: 'Carne Assada',
    //     ingredients: ['ingredient1', 'ingredient2'],
    //     description: 'description',
    //     category: CategoryEnum.meat),
    // RecipeEntity(
    //     uuid: 'uuid4',
    //     title: 'Bolo de Cenoura',
    //     ingredients: ['ingredient1', 'ingredient2'],
    //     description: 'description',
    //     category: CategoryEnum.cakes),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<RecipeProvider>(context);
    list = store.listRecipes;

    return Scaffold(
      appBar: MenuBarComponent(),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: ((context, index) {
          return Card(
            child: Row(
              children: [
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
                  icon: Icons.my_library_books,
                  onPressed: (){},
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
