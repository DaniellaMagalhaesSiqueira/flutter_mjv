import 'package:app1/components/spacer_component.dart';
import 'package:app1/entities/afazer_entity.dart';
import 'package:app1/pages/home/components/item_widget.dart';
import 'package:app1/pages/home/components/novo_item_widget.dart';
import 'package:flutter/material.dart';
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
  late List<AfazeresEntity> _listaAfazeres;
  late int acumulador;
  late TesteEntity teste;

  void handleCallback() {
    if (widget.callback != null) {
      widget.callback!(1);
    }
  }

  void handleAdicionar() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children:  [
           NovoItemWidget(callback: (item) {
                _listaAfazeres.add(item);
              setState(() {
                _listaAfazeres = _listaAfazeres;
              });
           },),
        ],);
      },
    );
  }

  void handleExcluir(int index) {
    _listaAfazeres.removeAt(index);

    setState(() {
      _listaAfazeres = _listaAfazeres;
    });
  }

  @override
  void initState() {
    _listaAfazeres = [
      AfazeresEntity(
        uuid: 'teste1',
        titulo: 'Teste 1',
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        isConcluido: false,
      ),
      AfazeresEntity(
        uuid: 'teste2',
        titulo: 'Teste 2',
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        isConcluido: true,
      ),
    ];
    super.initState();
  }

  //  buscarDados() async {
  //   await service.fectch();
  // }
  @override
  Widget build(BuildContext context) {
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
            itemCount: _listaAfazeres.length,
            itemBuilder: (context, index) {
              final item = _listaAfazeres.elementAt(index);
              return ItemWidget(
                item: item,
                onPressed: () {
                  handleAdicionar();
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
