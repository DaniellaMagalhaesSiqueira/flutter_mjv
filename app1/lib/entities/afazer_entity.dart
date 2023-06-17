

import 'afazer_checklist_entity.dart';

class AfazeresEntity{

  String uuid;
  String titulo;
  DateTime dataInicio;
  DateTime dataFim;
  bool? isConcluido;
  List<AfazeresChecklistEntity>? conteudos;
  String? image;

  AfazeresEntity({
    required this.uuid,
    required this.titulo,
    required this.dataInicio,
    required this.dataFim,
    this.isConcluido,
    this.conteudos,
    this.image
  });
}