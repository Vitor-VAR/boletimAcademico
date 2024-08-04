import 'package:mobx/mobx.dart';
import '../models/database_helper.dart';
import '../models/disciplina.dart';

part 'disciplina_store.g.dart';

class DisciplinaStore = _DisciplinaStore with _$DisciplinaStore;

abstract class _DisciplinaStore with Store {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @observable
  ObservableList<Disciplina> disciplinas = ObservableList<Disciplina>();

  @action
  Future<void> loadDisciplinas() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('disciplinas');
    disciplinas = ObservableList.of(maps.map((map) => Disciplina.fromMap(map)).toList());
  }

  @action
  Future<void> addDisciplina(Disciplina disciplina) async {
    final db = await _dbHelper.database;
    await db.insert('disciplinas', disciplina.toMap());
    await loadDisciplinas();
  }

  @action
  Future<void> removeDisciplina(int id) async {
    final db = await _dbHelper.database;
    await db.delete('disciplinas', where: 'id = ?', whereArgs: [id]);
    await loadDisciplinas();
  }
}
