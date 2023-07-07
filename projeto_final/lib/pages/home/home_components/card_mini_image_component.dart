


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/recipe_provider.dart';
import '../../../services/image_service.dart';

class CardMiniImageComponent extends StatefulWidget {
  final String image;
  const CardMiniImageComponent({super.key, this.image = ''});

  @override
  State<CardMiniImageComponent> createState() => _CardMiniImageComponentState();
}

late RecipeProvider store;
late String _image;

class _CardMiniImageComponentState extends State<CardMiniImageComponent> {

@override
  void initState() {
    store = Provider.of<RecipeProvider>(context, listen: false);
    _image = widget.image;
    super.initState();
  }

  Widget putImage(image) {
    if (image != '') {
      return Image.memory(
        ImageService().decodeBase64(image),
        fit: BoxFit.cover,
        width: 50,
        height: 50,
      );
    }

    return const Icon(Icons.image_search, size: 50);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        child: putImage(widget.image),
      ),
    );
  }
}