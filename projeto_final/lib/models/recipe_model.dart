


import 'category_model.dart';


class RecipeModel {
  String uuid;
  String title;
  List<String> ingredients;
  CategoryModel category;

  RecipeModel({
    required this.uuid,
    required this.title,
    required this.ingredients,
    required this.category,
  });
  
}