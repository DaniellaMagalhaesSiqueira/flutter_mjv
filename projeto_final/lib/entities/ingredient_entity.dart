// class IngredientEntity {
//   final int quantity;
//   final String name;

//   IngredientEntity({
//     required this.quantity,
//     required this.name,
//   });

//   Map<String, dynamic> toJson(){
//     return {
//       'quantity': quantity,
//       'name': name,
//     };
//   }

//   factory IngredientEntity.fromJson(Map<String, dynamic> json){
//     return IngredientEntity(
//       quantity: json['quantity'],
//       name: json['name'],
//     );
//   }

//   static List<IngredientEntity> fromJsonList(List<dynamic>? json){
//     return json?.map((e) => IngredientEntity.fromJson(e)).toList() ?? [];
//   }

// }
