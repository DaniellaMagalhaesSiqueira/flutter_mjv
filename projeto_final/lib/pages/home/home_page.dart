import 'package:flutter/material.dart';
import 'package:projeto_final/components/spacer_component.dart';
import 'package:projeto_final/models/category_enum.dart';
import 'package:projeto_final/models/recipe_model.dart';

import '../../components/menu_bar_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //página selecionada
  late int page;
  final recipes = [
    RecipeModel(
        uuid: 'uuid',
        title: 'Peru de Natal',
        ingredients: ['ingredient1', 'ingredient2'],
        description: 'description',
        category: CategoryEnum.birds),
    RecipeModel(
        uuid: 'uuid2',
        title: 'Caldo Verde',
        ingredients: ['ingredient1', 'ingredient2'],
        description: 'description',
        category: CategoryEnum.soups),
    RecipeModel(
        uuid: 'uuid3',
        title: 'Carne Assada',
        ingredients: ['ingredient1', 'ingredient2'],
        description: 'description',
        category: CategoryEnum.meat),
    RecipeModel(
        uuid: 'uuid4',
        title: 'Bolo de Cenoura',
        ingredients: ['ingredient1', 'ingredient2'],
        description: 'description',
        category: CategoryEnum.cakes),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBarComponent(),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: ((context, index) {
          return Card(
            child: Row(
            children: [
              Text(recipes[index].title),
              const SpacerComponent(isHorizontal: true,),
              Text(CategoryStatic.getString(recipes[index].category)),
            ],
          ),
          );
        }),
        
      ),
    );
  }
}
