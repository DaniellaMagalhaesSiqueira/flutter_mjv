

import 'package:flutter/material.dart';
import 'package:projeto_final/entities/recipe_entity.dart';

import '../../../components/spacer_component.dart';

class RestricionsConponent extends StatelessWidget {

  final RecipeEntity recipe;
  const RestricionsConponent({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: 30,
                  child:SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                            recipe.isVegetarian ? const Text('Vegetariana') : Text(''),  const SpacerComponent(isHorizontal: true, size: 15,),
                            recipe.isVegan ? const Text('Vegana') : Text(''),const SpacerComponent(isHorizontal: true, size: 15,),
                            recipe.isSugarFree ? const Text('Zero Açúcar') : Text(''),const SpacerComponent(isHorizontal: true, size: 15,),
                            recipe.isMilkFree ? const Text('Zero Lactose') : Text(''),
                          ],
                        ),
                  ),
                );
  }
}