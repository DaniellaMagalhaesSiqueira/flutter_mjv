import 'package:app1/components/body_component.dart';
import 'package:app1/components/spacer_component.dart';
import 'package:app1/pages/detalhe/components/detalhe_header.dart';
import 'package:app1/pages/detalhe/components/detalhe_item_widget.dart';
import 'package:app1/pages/detalhe/components/detalhe_menu_widget.dart';

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
  int? index;

  void onEditImage() async {
    final pickerService = PickerService();
    final image = await pickerService.getImage(ImageSource.gallery);
    //  final image2 = await pickerService.getImage(ImageSource.camera);
    if (image != null) {
      final base64 = pickerService.base64(await image.readAsBytes());
      store.selecionado!.image = base64;
      store.atualizarItemAfazer(index!);
    }
  }

 
  void excluirConteudo(indexConteudo, indexItem) {
    store.excluirConteudoItem(indexConteudo, indexItem);
  }

  void alterarConteudo(conteudos, indexItem) {
    store.alterarConteudo(conteudos, indexItem);
  }

  void onDone() {
    store.selecionado!.isConcluido = true;
    store.atualizarItemAfazer(index!);
  }

  void onDelete() {
    store.removerAfazer(index!);
    Navigator.pop(context);
  }

  void itemOnChanged(int indexConteudo, bool val){
    store.selecionado!.conteudos[indexConteudo].isChecked = val;
    store.atualizarItemAfazer(index!);
  }

 List<Widget> lista() {
    return store.selecionado!.conteudos.asMap().entries.map((el) {
      return DetalheItemWidget(
        item: el.value,
        onChanged: (val) {
          itemOnChanged(el.key, val ?? false);
        },
      );
    }).toList();

  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null) {
      index = args as int;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;
    // index = argumentos.index!;
    store = Provider.of<AfazerProvider>(context);
    if (store.selecionado == null) {
      Navigator.of(context).pop();
      return const Text('Selcione um item da lista');
    }
    final item = store.selecionado;
    return BodyComponent(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetalheHeaderWidget(
            onEdit: onEditImage,
            item: item!,
          ),
          const SpacerComponent(),
          DetalheMenuWidget(
            item: store.selecionado!,
            onDelete: onDelete,
            onDone: onDone,
          ),
          const SpacerComponent(),
          ...lista(),
          // Text(item.titulo,
          //     textAlign: TextAlign.left, style: const TextStyle(fontSize: 20)),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height - 550,
          //   child: ListView.builder(
          //     itemCount: item.conteudos.length,
          //     itemBuilder: (context, index) {
          //       final conteudo = item.conteudos[index];
          //       return CheckboxListTile(
          //         value: conteudo.isChecked,
          //         title: Text(conteudo.titulo),
          //         controlAffinity: ListTileControlAffinity.leading,
          //         onChanged: (value) {
          //           setState(() {
          //             conteudo.isChecked = value!;

          //           });
          //         },
          // secondary: IconButtonComponent(
          //   icon: Icons.delete,
          //   color: Colors.red,
          //   onPressed: () {
          //     int idxCont = item.conteudos.indexOf(conteudo);
          //     setState(() {
          //       excluirConteudo(idxCont,index);
          //     });
          //   },
          // ),
          //       );
          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: 100,
          //   child: Row(children: [
          //     const IconButtonComponent(),
          //   ]),
          // ),
        ],
      ),
      )
    );
  }
}
