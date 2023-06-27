import 'dart:developer';

import 'package:app1/app_routs.dart';
import 'package:app1/entities/afazer_entity.dart';
import 'package:app1/pages/home/components/item_widget.dart';
import 'package:app1/providers/afazer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AbaAfazeres extends StatefulWidget {
  // final int valorInicial;
  // final void Function(int tabIndex)? callback;

  const AbaAfazeres({
    super.key,
    // required this.valorInicial,
    // this.callback,
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

  void handleExcluir(int index) {
    store.removerAfazer(index);
    // List<AfazeresEntity> lista = store.listaAfazeres;
    // lista.removeAt(index);
    // store.listaAfazeres = lista;
    // setState(() {
    //   store.listaAfazeres;
    // });
  }
//navegação
  void onDetalhes(AfazeresEntity item, int index){

    // Navigator.pushNamed(context, AppRoutes.detalhe, arguments: Argumentos(index: index));
    store.selecionado = item;
    Navigator.pushNamed(context, AppRoutes.detalhe, arguments: index);
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
    
    return ListView.builder(
      itemCount: store.listaAfazeres.length,
      itemBuilder: (context, index) {
        final item = store.listaAfazeres.elementAt(index);
        return Dismissible(
                key: Key(item.uuid),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    handleExcluir(index);
                  }
                },
                child: ItemWidget(
                  item: item,
                  onPressed: () {
                    onDetalhes(item, index);
                  },
                ),
              );
      },
    );
  }
}
