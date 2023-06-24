import 'package:app1/components/body_component.dart';
import 'package:app1/pages/detalhe/components/detalhe_header.dart';
import 'package:app1/providers/afazer_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../services/picker_service.dart';

class DetalhePage extends StatefulWidget {
  const DetalhePage({super.key});

  @override
  State<DetalhePage> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  late AfazerProvider store;

  void onEditImage() async {
    final pickerService = PickerService();
    final image = await pickerService.getImage(ImageSource.gallery);
    //  final image2 = await pickerService.getImage(ImageSource.camera);
    if(image != null){
      final base64 = pickerService.base64(await image.readAsBytes());
      store.atualizarItemAfazer(0, base64);
    }
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    return BodyComponent(
      child: Column(
        children: [
          DetalheHeaderWidget(
            onEdit: onEditImage,
            item: store.listaAfazeres.elementAt(0),
          ),
        ],
      ),
    );
  }
}
