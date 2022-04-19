import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/breed.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'flutter_sqflite_database.db');

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE breeds(id INTEGER PRIMARY KEY, name TEXT, description TEXT)',
    );

    await db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, color INTEGER, breedId INTEGER, FOREIGN KEY (breedId) REFERENCES breeds(id) ON DELETE SET NULL)');
  }

  Future<void> insertBreed(Breed breed) async {
    final db = await _databaseService.database;

    await db.insert('breeds', breed.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Breed>> breeds() async {
    final db = await _databaseService.database;

    final List<Map<String, dynamic>> maps = await db.query('breeds');

    return List.generate(maps.length, (index) => Breed.fromMap(maps[index]));
  }

  Future<void> updateBreed(Breed breed) async {
    final db = await _databaseService.database;

    await db.update('breeds', breed.toMap(),
        where: 'id = ?', whereArgs: [breed.id]);
  }

  Future<void> deleteBreed(int id) async {
    final db = await _databaseService.database;

    await db.delete('breeds', where: 'id = ?', whereArgs: [id]);
  }
}
