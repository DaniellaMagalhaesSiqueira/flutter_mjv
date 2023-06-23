

class CategoryModel {
  String uuid;
  bool isVegan;
  bool isSugarFree;
  bool isVegetarian;
  bool isMilkFree;

  CategoryModel({
    required this.uuid,
    this.isVegan = false,
    this.isSugarFree = false,
    this.isVegetarian = false,
    this.isMilkFree = false,
  });
}