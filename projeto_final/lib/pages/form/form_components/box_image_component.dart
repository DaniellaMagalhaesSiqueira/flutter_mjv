import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_final/components/icon_button_component.dart';
import 'package:projeto_final/providers/recipe_provider.dart';
import 'package:provider/provider.dart';
import '../../../services/image_service.dart';

class BoxImageConponent extends StatefulWidget {
  final String image;
  final bool isEdit;

  BoxImageConponent({super.key, this.image = '', required this.isEdit});

  @override
  State<BoxImageConponent> createState() => _BoxImageConponentState();
}

late RecipeProvider store;
late String _image;

class _BoxImageConponentState extends State<BoxImageConponent> {
  @override
  void initState() {
    store = Provider.of<RecipeProvider>(context, listen: false);
    _image = widget.image;
    super.initState();
  }

  Widget putImage() {
    if (_image != '') {
      return Image.memory(
        ImageService().decodeBase64(_image),
        fit: BoxFit.cover,
      );
    }

    return const Icon(Icons.image_search, size: 50);
  }

  insertImage() async {
    final imageService = ImageService();
    final image = await imageService.getImage(ImageSource.gallery);
    if (image != null) {
      final base64 = imageService.base64(await image.readAsBytes());
      _image = base64;
      if (_image != '') {
        store.image = base64;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: 250,
          child: Card(
            child: putImage(),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            child: const Text('Título'),
          ),
        ),
        Positioned(
          bottom: 18,
          right: 18,
          child: IconButtonComponent(
            icon: Icons.edit_outlined,
            size: 24,
            onPressed: insertImage,
          ),
        ),
      ],
    );
  }
}
