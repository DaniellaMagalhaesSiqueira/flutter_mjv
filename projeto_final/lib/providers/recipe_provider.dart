import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/entities/recipe_entity.dart';
import 'package:projeto_final/services/recipe_service.dart';

class RecipeProvider with ChangeNotifier {
  final service = RecipeService();

  List<RecipeEntity> _listRecipes = [];
  RecipeEntity? _recipeSelected;
  String? _image = '';
  List<RecipeEntity> _filter = [];
  // int? _index;

  RecipeProvider() {
    searchRecipes();
  }

  searchRecipes() async {
    listRecipes = await service.search();
    filter = listRecipes;
  }

  set listRecipes(List<RecipeEntity> list) {
    _listRecipes = list;
    service.save(list);
    notifyListeners();
  }

  set image(String? image){
    _image = image;
    notifyListeners();
  }

  set filter(List<RecipeEntity> filter){
    _filter = filter;
    notifyListeners();
  }

  List<RecipeEntity> get listRecipes => _listRecipes;

  RecipeEntity? get recipeSelected {
    return _recipeSelected;
  }

  String? get image => _image;

  List<RecipeEntity> get filter => _filter;
  set recipeSelected(RecipeEntity? recipe){
    _recipeSelected = recipe;
    notifyListeners();
  }

  void clearSelections(){
    _image = '';
    _recipeSelected = null;
  }
 

}
