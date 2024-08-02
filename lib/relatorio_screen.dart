import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'nota_store.dart';
import 'disciplina_store.dart';
import 'disciplina.dart';
import 'nota.dart';

class RelatorioScreen extends StatelessWidget {
  final NotaStore _notaStore = NotaStore();
  final DisciplinaStore _disciplinaStore = DisciplinaStore();

  RelatorioScreen() {
    _notaStore.loadNotas();
    _disciplinaStore.loadDisciplinas();
  }

  double calcularMedia(Nota nota, Disciplina disciplina) {
    if (disciplina.tipo == 'anual') {
      return (nota.nota1 + nota.nota2 + (nota.nota3 ?? 0) + (nota.nota4 ?? 0)) / 4.0;
    } else {
      return (nota.nota1 + nota.nota2) / 2.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatório de Disciplinas'),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: _notaStore.notas.length,
          itemBuilder: (context, index) {
            final nota = _notaStore.notas[index];
            final disciplina = _disciplinaStore.disciplinas.firstWhere((d) => d.id == nota.disciplinaId);
            final media = calcularMedia(nota, disciplina);
            final aprovado = media >= 5.0;

            return ListTile(
              title: Text(disciplina.nome),
              subtitle: Text('Média: $media - ${aprovado ? 'Aprovado' : 'Reprovado'}'),
            );
          },
        ),
      ),
    );
  }
}
