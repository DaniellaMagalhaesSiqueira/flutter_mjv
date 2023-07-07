

import 'package:flutter/material.dart';
import 'package:projeto_final/entities/recipe_entity.dart';

import '../../../services/image_service.dart';

class CardImageComponent extends StatelessWidget {
  final RecipeEntity recipe;
  const CardImageComponent({super.key, required this.recipe});

   Widget putImage() {
    if (recipe.image != '') {
      return Image.memory(
        ImageService().decodeBase64(recipe.image),
        fit: BoxFit.cover,
      );
    }

    return const Icon(Icons.image_search, size: 50);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // deslocamento da sombra (x, y)
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: putImage(),
              ),
            ),
          );
  }
}