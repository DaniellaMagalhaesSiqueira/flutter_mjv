import 'package:flutter/material.dart';
import 'package:projeto_final/components/menu_bar_component.dart';
import 'package:projeto_final/components/spacer_component.dart';
import 'package:projeto_final/entities/category_enum.dart';
import 'package:provider/provider.dart';

import '../../entities/recipe_entity.dart';
import '../../providers/recipe_provider.dart';
import '../../services/image_service.dart';
import 'detail_components/card_image_component.dart';
import 'detail_components/restrictions_component.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<Text> restrictions = const [
    Text('Vegetariana'),
    Text('Vegana'),
    Text('Zero Açúcar'),
    Text('Zero Lactose'),
  ];
  late RecipeEntity _recipe;

  @override
  void initState() {
    final storeNoListen = Provider.of<RecipeProvider>(context, listen: false);
    _recipe = storeNoListen.recipeSelected!;
    super.initState();
  }

  Widget putImage() {
    if (_recipe.image != '') {
      return Image.memory(
        ImageService().decodeBase64(_recipe.image),
        fit: BoxFit.cover,
      );
    }

    return const Icon(Icons.image_search, size: 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBarComponent(isHome: false),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _recipe.title,
            textAlign: TextAlign.center,
            textWidthBasis: TextWidthBasis.parent,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SpacerComponent(),
          CardImageComponent(recipe: _recipe),
          Card(
            child: Column(
              children: [
                const Text('Ingredientes:'),
                SizedBox(
                  // height: double.maxFinite - 300,
                  height: MediaQuery.of(context).size.height - 600,
                  child: ListView.builder(
                    itemCount: _recipe.ingredients.length,
                    itemBuilder: ((context, index) {
                      return Text(
                        _recipe.ingredients[index],
                        textAlign: TextAlign.center,
                      );
                    }),
                  ),
                ),
                const Divider(),
                Container(
                    height: 200,
                  child: SingleChildScrollView(
                    child: Text(_recipe.description),
                  ),
                ),
                const Divider(),
                const RestricionsConponent(),
                const Divider(),
                Text(
                  CategoryStatic.getString(_recipe.category),
                  textAlign: TextAlign.center,
                  textWidthBasis: TextWidthBasis.parent,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
