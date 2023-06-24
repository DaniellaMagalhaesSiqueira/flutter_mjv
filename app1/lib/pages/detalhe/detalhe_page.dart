import 'package:app1/components/body_component.dart';
import 'package:app1/components/icon_button_component.dart';
import 'package:app1/components/spacer_component.dart';
import 'package:app1/pages/detalhe/components/detalhe_header.dart';
import 'package:app1/providers/afazer_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../app_routs.dart';
import '../../services/picker_service.dart';

class DetalhePage extends StatefulWidget {
  // final int index;
  static final routName = AppRoutes.detalhe;
  const DetalhePage({
    super.key,
    // required this.index,
  });

  @override
  State<DetalhePage> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  late AfazerProvider store;
  late int index;
  void onEditImage() async {
    final pickerService = PickerService();
    final image = await pickerService.getImage(ImageSource.gallery);
    //  final image2 = await pickerService.getImage(ImageSource.camera);
    if (image != null) {
      final base64 = pickerService.base64(await image.readAsBytes());
      store.atualizarItemAfazer(index, base64);
    }
  }

  void excluirConteudo(indexConteudo, indexItem){
    store.excluirConteudoItem(indexConteudo, indexItem);
  }

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;
    index = argumentos.index!;
    store = Provider.of<AfazerProvider>(context);
    final item = store.listaAfazeres.elementAt(argumentos.index ?? 0);
    return BodyComponent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetalheHeaderWidget(
            onEdit: onEditImage,
            item: item,
          ),
          const SpacerComponent(),
          Text(item.titulo,
              textAlign: TextAlign.left, style: const TextStyle(fontSize: 20)),
          SizedBox(
            height: MediaQuery.of(context).size.height - 450,
            child: ListView.builder(
              itemCount: item.conteudos.length,
              itemBuilder: (context, index) {
                final conteudo = item.conteudos[index];
                return CheckboxListTile(
                  value: conteudo.isChecked,
                  title: Text(conteudo.titulo),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      conteudo.isChecked = value!;
                    });
                  },
                  secondary: IconButtonComponent(
                    icon: Icons.delete,
                    color: Colors.red,
                    onPressed: () {
                      int idxCont = item.conteudos.indexOf(conteudo);
                      setState(() {
                        excluirConteudo(idxCont,index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
