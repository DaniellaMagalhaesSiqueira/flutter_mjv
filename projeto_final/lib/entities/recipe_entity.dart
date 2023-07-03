

import 'dart:convert';

import 'category_enum.dart';

class RecipeEntity {
  String uuid;
  String title;
  List<String> ingredients;
  String description;
  bool isVegan;
  bool isSugarFree;
  bool isVegetarian;
  bool isMilkFree;
  CategoryEnum category;
  String? image;
  

  RecipeEntity({
    required this.uuid,
    required this.title,
    required this.ingredients,
    required this.description,
    this.isVegan = false,
    this.isSugarFree = false,
    this.isVegetarian = false,
    this.isMilkFree = false,
    required this.category,
    this.image,
  });

  factory RecipeEntity.fromJson(Map<String, dynamic> json){

     List<dynamic> ingredientsJson = json['ingredients'];
     List<String> ingredients = ingredientsJson.cast<String>();
   
    return RecipeEntity(
      uuid: json['uuid'], 
      title: json['title'], 
      ingredients: ingredients,
      description: json['description'], 
      category: CategoryStatic.getEnum(json['category']),
      image: json['image'],
      );
  }
  

  static List<RecipeEntity> fromJsonList(List<dynamic>? json){
    return json?.map((recipe) => RecipeEntity.fromJson(recipe)).toList() ?? [];
  }
  //Conversão para json ao salvar no storage
   Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'title': title, 
      'ingredients': ingredients,
      'description': description, 
      'category': CategoryStatic.getString(category),
      'image': image,
    };
  }
}