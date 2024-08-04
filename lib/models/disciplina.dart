class Disciplina {
  final int? id;
  final String nome;
  final String tipo; // 'anual' ou 'semestral'

  Disciplina({
    this.id,
    required this.nome,
    required this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
    };
  }

  factory Disciplina.fromMap(Map<String, dynamic> map) {
    return Disciplina(
      id: map['id'],
      nome: map['nome'],
      tipo: map['tipo'],
    );
  }
}
