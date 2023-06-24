

import 'afazer_checklist_entity.dart';

class AfazeresEntity{

  String uuid;
  String titulo;
  DateTime dataInicio;
  DateTime dataFim;
  bool isConcluido;
  List<AfazeresChecklistEntity> conteudos;
  String? image;

  AfazeresEntity({
    required this.uuid,
    required this.titulo,
    required this.dataInicio,
    required this.dataFim,
    this.isConcluido = false,
    this.conteudos = const [],
    this.image
  });

  factory AfazeresEntity.fromJson(Map<String, dynamic> json){
    return AfazeresEntity(
      uuid: json['uuid'],
      titulo: json['titulo'],
      dataInicio: DateTime.fromMicrosecondsSinceEpoch(json['dataInicio']),
      dataFim: DateTime.fromMicrosecondsSinceEpoch(json['dataFim']),
      isConcluido: json['isConcluido'],
      conteudos: AfazeresChecklistEntity.fromJsonList(json['conteudos']),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'uuid': uuid,
      'titulo': titulo,
      'dataInicio': dataInicio.microsecondsSinceEpoch,
      'dataFim': dataFim.microsecondsSinceEpoch,
      'isConcluido': isConcluido,
      'conteudos': conteudos,
      if(image != null) 'image': image
    };
  }

  static List<AfazeresEntity> fromJsonList(List<dynamic>? json){
    return json?.map((item) => AfazeresEntity.fromJson(item)).toList() ?? [];
  }

  // static List<Map<String, dynamic>> toJsonList(List<AfazeresEntity> itens){
  //   List<Map<String, dynamic>> lista = itens.map((item) => item.toJson()).toList();
  //   return lista;
  // }
}