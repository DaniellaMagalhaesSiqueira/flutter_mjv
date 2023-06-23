
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/recipe_model.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  // List<String> ingredients = ['Farinha', 'Cenoura', 'ovo', 'manteiga', 'leite'];
  // Category cat = Category(uuid: const Uuid().v4(), isVegetarian: true);
  // List<RecipeModel> recipes = [
  //   RecipeModel(uuid: const Uuid().v4(), title: 'Bolo de Cenoura', ingredients: ingredients, category: category)
  // ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 200,
          // child: ListView.builder(itemBuilder:,
          
          // ),
        ),
      ],
    );
  }
}