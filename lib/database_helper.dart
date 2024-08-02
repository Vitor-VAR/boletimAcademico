import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('boletim.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE disciplinas (
  id $idType,
  nome $textType,
  tipo $textType
)
    ''');

    await db.execute('''
CREATE TABLE notas (
  id $idType,
  disciplinaId $integerType,
  nota1 $integerType,
  nota2 $integerType,
  nota3 $integerType,
  nota4 $integerType,
  FOREIGN KEY (disciplinaId) REFERENCES disciplinas (id) ON DELETE CASCADE
)
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
