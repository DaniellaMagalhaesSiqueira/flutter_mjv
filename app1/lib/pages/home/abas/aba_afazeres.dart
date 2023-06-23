import 'package:app1/components/spacer_component.dart';
import 'package:app1/pages/home/components/item_widget.dart';
import 'package:app1/pages/home/components/novo_item_widget.dart';
import 'package:app1/providers/afazer_provider.dart';
import 'package:app1/services/afazer_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../entities/afazer_entity.dart';
import '../../../entities/teste_entity.dart';


class AbaAfazeres extends StatefulWidget {
  final int valorInicial;
  final void Function(int tabIndex)? callback;
 

  const AbaAfazeres({
    super.key,
    required this.valorInicial,
    this.callback,
  });
  @override
  State createState() => _AbaAfazeres();
}

class _AbaAfazeres extends State<AbaAfazeres> {

  // AfazerService service = AfazerService();
  late AfazerProvider store;
  // late List<AfazeresEntity> _listaAfazeres;
  // late int acumulador;
  // late TesteEntity teste;

  // Future<List<AfazeresEntity>> obterLista() async{
  //   return await service.buscar();
  // }

  // void handleCallback() {
  //   if (widget.callback != null) {
  //     widget.callback!(1);
  //   }
  // }

  void handleAdicionar() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children:  [
           NovoItemWidget(callback: (item) {           
              store.listaAfazeres = [...store.listaAfazeres, item];
              //  setState(() {
                // _listaAfazeres = _listaAfazeres;
              //  });
           },),
        ],);
      },
    );
  }

  void handleExcluir(int index) {
    List<AfazeresEntity> lista = store.listaAfazeres;
    lista.removeAt(index);
    store.listaAfazeres = lista;
    setState(() {
      store.listaAfazeres;
    });
  }

  @override
  void initState() {
    super.initState();
    // obterLista().then((dados) => {
    //   setState((){
    //     _listaAfazeres = dados;
    //   })
    // });
    // _listaAfazeres = [
    //   AfazeresEntity(
    //     uuid: 'teste1',
    //     titulo: 'Teste 1',
    //     dataInicio: DateTime.now(),
    //     dataFim: DateTime.now(),
    //     isConcluido: false,
    //   ),
    //   AfazeresEntity(
    //     uuid: 'teste2',
    //     titulo: 'Teste 2',
    //     dataInicio: DateTime.now(),
    //     dataFim: DateTime.now(),
    //     isConcluido: true,
    //   ),
    // ];
  
  }

  //  buscarDados() async {
  //   await service.fectch();
  // }




  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    return Column(
      children: [
        const SpacerComponent(),
        ElevatedButton(
          onPressed: handleAdicionar,
          child: const Text('Adicionar'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: ListView.builder(
            itemCount: store.listaAfazeres.length,
            itemBuilder: (context, index) {
              final item = store.listaAfazeres.elementAt(index);
              return ItemWidget(
                item: item,
                onPressed: () {
                  handleExcluir(index);
                },
              );
            },
          ),
        ),
        const SpacerComponent(),
      ],
    );
  }
}
