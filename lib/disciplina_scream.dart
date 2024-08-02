import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'disciplina_store.dart';
import 'disciplina.dart';

class DisciplinaScreen extends StatelessWidget {
  final DisciplinaStore _disciplinaStore = DisciplinaStore();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();

  DisciplinaScreen() {
    _disciplinaStore.loadDisciplinas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Disciplinas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome da Disciplina'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _tipoController,
              decoration: InputDecoration(labelText: 'Tipo (anual ou semestral)'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final nome = _nomeController.text;
              final tipo = _tipoController.text;

              final disciplina = Disciplina(nome: nome, tipo: tipo);
              _disciplinaStore.addDisciplina(disciplina);
            },
            child: Text('Adicionar Disciplina'),
          ),
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: _disciplinaStore.disciplinas.length,
                itemBuilder: (context, index) {
                  final disciplina = _disciplinaStore.disciplinas[index];
                  return ListTile(
                    title: Text(disciplina.nome),
                    subtitle: Text(disciplina.tipo),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _disciplinaStore.removeDisciplina(disciplina.id!);
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
