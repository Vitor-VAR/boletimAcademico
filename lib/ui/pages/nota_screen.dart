import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../stores/nota_store.dart';
import '../../stores/disciplina_store.dart';
import '../../models/nota.dart';

class NotaScreen extends StatelessWidget {
  final NotaStore _notaStore = NotaStore();
  final DisciplinaStore _disciplinaStore = DisciplinaStore();

  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();
  final TextEditingController _nota4Controller = TextEditingController();

  NotaScreen() {
    _notaStore.loadNotas();
    _disciplinaStore.loadDisciplinas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Notas'),
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) => DropdownButton<int>(
              hint: Text('Selecione a Disciplina'),
              items: _disciplinaStore.disciplinas.map((disciplina) {
                return DropdownMenuItem<int>(
                  value: disciplina.id,
                  child: Text(disciplina.nome),
                );
              }).toList(),
              onChanged: (value) {
                // Selecione a disciplina
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nota1Controller,
              decoration: InputDecoration(labelText: 'Nota 1'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nota2Controller,
              decoration: InputDecoration(labelText: 'Nota 2'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nota3Controller,
              decoration: InputDecoration(labelText: 'Nota 3 (opcional)'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nota4Controller,
              decoration: InputDecoration(labelText: 'Nota 4 (opcional)'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Implementar lógica para adicionar nota
            },
            child: Text('Adicionar Nota'),
          ),
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: _notaStore.notas.length,
                itemBuilder: (context, index) {
                  final nota = _notaStore.notas[index];
                  return ListTile(
                    title: Text('Disciplina ID: ${nota.disciplinaId}'),
                    subtitle: Text('Nota 1: ${nota.nota1}, Nota 2: ${nota.nota2}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _notaStore.removeNota(nota.id!);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
