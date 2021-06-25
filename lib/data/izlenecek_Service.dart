import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_project/models/izlenecek.dart';


class izlenecekService {
  static izlenecekService instance =izlenecekService._internal();
  izlenecekService._internal();
  factory izlenecekService(){
    return instance;
  }

  Future<List<izlenecek>> getIzlenecek(bool isDone) async {
    final mapList = await getIzlenecekMaps();
    List<izlenecek> izlenecekList = [];
    mapList.forEach((element) {
      izlenecekList.add(izlenecek.fromMap(element));
    });
    if (isDone) {
      return izlenecekList.where((element) => !element.bittiMi).toList();
    }
    return izlenecekList.where((element) => element.bittiMi).toList();
  }

  Future<List<Map<String, dynamic>>> getIzlenecekMaps() async {
    Database db = await this.db;
    return await db.query("todos");
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "todo.db";
    final izlenecekDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return izlenecekDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,isDone INT)");
  }

  Future<int> addIzlenecek(izlenecek izle) async {
    Database db = await this.db;
    return await db.insert("todos", izle.toMap());
  }

  Future<int> updateIsDone(izlenecek izle) async {
    Database db = await this.db;
    return await db
        .update("todos", izle.toMap(), where: "id=?", whereArgs: [izle.id]);
  }
}
