

class RecipeModel {
  String uuid;
  String title;
  List<String> ingredients;
  String description;
  bool isVegan;
  bool isSugarFree;
  bool isVegetarian;
  bool isMilkFree;
  

  RecipeModel({
    required this.uuid,
    required this.title,
    required this.ingredients,
    required this.description,
    this.isVegan = false,
    this.isSugarFree = false,
    this.isVegetarian = false,
    this.isMilkFree = false,
  });
  
}