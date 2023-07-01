


import 'category_model.dart';


class RecipeModel {
  String uuid;
  String title;
  List<String> ingredients;
  String description;
  CategoryModel category;

  RecipeModel({
    required this.uuid,
    required this.title,
    required this.ingredients,
    required this.category,
    required this.description,
  });
  
}