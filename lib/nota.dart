class Nota {
  final int? id;
  final int disciplinaId;
  final int nota1;
  final int nota2;
  final int? nota3;
  final int? nota4;

  Nota({
    this.id,
    required this.disciplinaId,
    required this.nota1,
    required this.nota2,
    this.nota3,
    this.nota4,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'disciplinaId': disciplinaId,
      'nota1': nota1,
      'nota2': nota2,
      'nota3': nota3,
      'nota4': nota4,
    };
  }

  factory Nota.fromMap(Map<String, dynamic> map) {
    return Nota(
      id: map['id'],
      disciplinaId: map['disciplinaId'],
      nota1: map['nota1'],
      nota2: map['nota2'],
      nota3: map['nota3'],
      nota4: map['nota4'],
    );
  }
}
