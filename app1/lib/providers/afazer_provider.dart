import 'dart:convert';

import 'package:app1/entities/afazer_entity.dart';
import 'package:app1/services/afazer_service.dart';
import 'package:flutter/foundation.dart';

class AfazerProvider with ChangeNotifier{

  final service = AfazerService();

  List<AfazeresEntity> _listaAfazeres = [];

  AfazerProvider(){
    buscarAfazeres();
  }

  buscarAfazeres() async{
    listaAfazeres = await service.buscar();
  }

  void removerAfazer(AfazeresEntity item) async {
    //removendo da lista
    // _listaAfazeres = buscarAfazeres().remove(item);
    // service.salvar(_listaAfazeres);
  }

  List<AfazeresEntity> get listaAfazeres => _listaAfazeres;

  set listaAfazeres(List<AfazeresEntity> value){
    _listaAfazeres = value;
    service.salvar(_listaAfazeres);
    notifyListeners();
  }

}