import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/entities/category_enum.dart';
import 'package:projeto_final/entities/recipe_entity.dart';
import 'package:projeto_final/services/recipe_service.dart';

class RecipeProvider with ChangeNotifier {
  final service = RecipeService();

  List<RecipeEntity> _listRecipes = [];
  RecipeEntity? _recipeSelected;
  // int? _index;

  RecipeProvider() {
    searchRecipes();
  }

  searchRecipes() async {
    listRecipes = await service.search();
  }

  set listRecipes(List<RecipeEntity> list) {
    _listRecipes = list;
    service.save(list);
    notifyListeners();
  }

  List<RecipeEntity> get listRecipes => _listRecipes;

  RecipeEntity? get recipeSelected {
    return _recipeSelected;
  }

  set recipeSelected(RecipeEntity? recipe){
    _recipeSelected = recipe;
    notifyListeners();
  }

  // void changeRecipe(RecipeEntity recipe){
  //   _listRecipes.map((e) {
  //     if(e.uuid == recipe.uuid){
  //       e = recipe;
  //       print(e.uuid);
  //       print(CategoryStatic.getString(e.category));
  //     }
  //   });
  //   service.save(_listRecipes);
  //   notifyListeners();
  // }
}
