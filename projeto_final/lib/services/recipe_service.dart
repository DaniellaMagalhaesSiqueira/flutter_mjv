import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entities/recipe_entity.dart';


class RecipeService {
  final _key = 'KEY_RECIPE';

  Future<void> save(List<RecipeEntity> recipes) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(recipes);
    await prefs.setString(_key, listJson);
  }

  Future<List<RecipeEntity>> search() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listJson = prefs.getString(_key);
    if(listJson != null){
      return RecipeEntity.fromJsonList(jsonDecode(listJson));
    }
    return [];
  }
}