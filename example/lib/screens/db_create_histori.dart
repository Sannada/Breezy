import 'dart:async';
import 'dart:io' as io;

import 'Histori.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Histori.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Histori(id INTEGER PRIMARY KEY, startPoint TEXT, endPoint TEXT, minBudget TEXT, maxBudget TEXT, numberOfGuests TEXT, departureDate TEXT, arriveDate TEXT)");
  }

  Future<int> saveHistori(Histori histori) async {
    var dbClient = await db;
    int res = await dbClient.insert("Histori", histori.toMap());
    return res;
  }

  Future<List<Histori>> getHistori() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Histori');
    List<Histori> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var histori =
      new Histori(list[i]["startPoint"], list[i]["endPoint"], list[i]["minBudget"], list[i]["maxBudget"],
          list[i]["numberOfGuests"], list[i]["departureDate"], list[i]["arriveDate"]);
      histori.setHistoriId(list[i]["id"]);
      employees.add(histori);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteHistori(Histori histori) async {
    var dbClient = await db;

    int res =
    await dbClient.rawDelete('DELETE FROM Histori WHERE id = ?', [histori.id]);
    return res;
  }

  Future<bool> update(Histori histori) async {
    var dbClient = await db;
    int res =   await dbClient.update("Histori", histori.toMap(),
        where: "id = ?", whereArgs: <int>[histori.id]);
    return res > 0 ? true : false;
  }
}
