class TesteEntity {
  String nome;
  int idade;
  String senha;

  TesteEntity({
    required this.nome,
    required this.idade,
    required this.senha,
  });
}

class TesteFilhoEntity extends TesteEntity implements Contrato{
  TesteFilhoEntity({
    required super.nome,
    required super.idade,
    required super.senha,
  });
  
  @override
  setNome(String nome) {
    this.nome = nome;
  }
}

abstract class Contrato {
  setNome(String nome);
}
