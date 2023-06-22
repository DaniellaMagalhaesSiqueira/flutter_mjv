class AfazeresChecklistEntity {
  String titulo;
  bool isChecked;

  AfazeresChecklistEntity({required this.titulo, required this.isChecked});

  Map<String, dynamic> toJason() {
    return {
      'isChecked': isChecked,
      'titulo': titulo,
    };
  }

  factory AfazeresChecklistEntity.fromJson(Map<String, dynamic> json) {
    return AfazeresChecklistEntity(
      titulo: json['titulo'],
      isChecked: json['isChecked'],
    );
  }

static List<AfazeresChecklistEntity> fromJsonList(List<dynamic>? json){
  return json?.map((item) => AfazeresChecklistEntity.fromJson(item)).toList() ?? [];
}
}
