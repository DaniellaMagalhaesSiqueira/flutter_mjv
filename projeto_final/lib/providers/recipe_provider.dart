

import 'package:flutter/material.dart';
import 'package:projeto_final/entities/recipe_entity.dart';
import 'package:projeto_final/services/recipe_service.dart';

class RecipeProvider with ChangeNotifier {
  final service = RecipeService();

  List<RecipeEntity> _listRecipes = [];
  // RecipeEntity? _selected;
  // int? _index;

  RecipeProvider() {
    searchRecipes();
  }

  searchRecipes() async{
    listRecipes = await service.search();
  }

  set listRecipes(List<RecipeEntity> list){
    _listRecipes = list;
    service.save(list);
    notifyListeners();
  }

   List<RecipeEntity> get listRecipes => _listRecipes;

}