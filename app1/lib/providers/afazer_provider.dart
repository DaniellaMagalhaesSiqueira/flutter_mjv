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

  List<AfazeresEntity> get listaAfazeres => _listaAfazeres;

  void set listaAfazeres(List<AfazeresEntity> value){
    _listaAfazeres = value;
    notifyListeners();
  }
}