import 'package:app1/entities/afazer_entity.dart';
import 'package:app1/services/afazer_service.dart';
import 'package:flutter/material.dart';

import '../pages/home/components/novo_item_widget.dart';

class AfazerProvider with ChangeNotifier{

  final service = AfazerService();

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

  void atualizarItemAfazer(int idx, String image){
    listaAfazeres.elementAt(idx).image = image;
    notifyListeners();
  }
  set listaAfazeres(List<AfazeresEntity> value){
    _listaAfazeres = value;
    service.salvar(_listaAfazeres);
    notifyListeners();
  }

}