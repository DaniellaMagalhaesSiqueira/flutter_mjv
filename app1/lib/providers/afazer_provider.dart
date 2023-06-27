import 'package:app1/entities/afazer_checklist_entity.dart';
import 'package:app1/entities/afazer_entity.dart';
import 'package:app1/services/afazer_service.dart';
import 'package:flutter/material.dart';

import '../pages/home/components/novo_item_widget.dart';

class AfazerProvider with ChangeNotifier{

  final service = AfazerService();

  AfazeresEntity? _selecionado;

  List<AfazeresEntity> _listaAfazeres = [];



  AfazerProvider(){
    buscarAfazeres();
  }



  buscarAfazeres() async{
    listaAfazeres = await service.buscar();
  }

  void removerAfazer(int index) async {
    listaAfazeres.removeAt(index);
    service.salvar(listaAfazeres);
    notifyListeners();
  }

  
  void abrirModalCadastratro(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children:  [
           NovoItemWidget(callback: (item) {    
            //chamando o método set para acionar o listener
              listaAfazeres = [item, ...listaAfazeres];       
              // listaAfazeres = [...listaAfazeres, item];
              //  setState(() {
                // _listaAfazeres = _listaAfazeres;
              //  });
           },),
        ],);
      },
    );
  }

  List<AfazeresEntity> get listaAfazeres => _listaAfazeres;

  AfazeresEntity? get selecionado => _selecionado;

  set listaAfazeres(List<AfazeresEntity> value){
    _listaAfazeres = value;
    service.salvar(_listaAfazeres);
    notifyListeners();
  }

  set selecionado(AfazeresEntity? value){
    _selecionado = value;
    notifyListeners();
  }

 void atualizarItemAfazer(int idx){
    // listaAfazeres.elementAt(idx).image = image;
    service.salvar(listaAfazeres);
    notifyListeners();
  }

  void excluirConteudoItem(int indexConteudo, int indexItem){
    final item = listaAfazeres[indexItem];
    item.conteudos.removeAt(indexConteudo);
    listaAfazeres[indexItem] = item;
    service.salvar(listaAfazeres);
    notifyListeners();
  }

  void alterarConteudo(List<AfazeresChecklistEntity> conteudos, int indexItem){
    listaAfazeres.elementAt(indexItem).conteudos = conteudos;
    service.salvar(listaAfazeres);
    notifyListeners();
  }


}