import 'package:mobx/mobx.dart';
import 'database_helper.dart';
import 'nota.dart';

part 'nota_store.g.dart';

class NotaStore = _NotaStore with _$NotaStore;

abstract class _NotaStore with Store {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @observable
  ObservableList<Nota> notas = ObservableList<Nota>();

  @action
  Future<void> loadNotas() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('notas');
    notas = ObservableList.of(maps.map((map) => Nota.fromMap(map)).toList());
  }

  @action
  Future<void> addNota(Nota nota) async {
    final db = await _dbHelper.database;
    await db.insert('notas', nota.toMap());
    await loadNotas();
  }

  @action
  Future<void> removeNota(int id) async {
    final db = await _dbHelper.database;
    await db.delete('notas', where: 'id = ?', whereArgs: [id]);
    await loadNotas();
  }
}
