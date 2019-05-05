
import 'dart:async';
import 'dart:io';

import 'database_object.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/*
Щоб працювати з базою даних преходимо на рядок -> 47!
І читаємо коментарі до кожного методу.
 */

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();


static Database _database;

Future<Database> get database async {
  if (_database != null)
    return _database;

  _database = await initDB();
  return _database;
}

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TrevelDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Trevel(id INTEGER PRIMARY KEY,"
              "startPoint TEXT,"
              "endPoint TEXT,"
              "minBudget TEXT,"
              "maxBudget TEXT,"
              "numberOfGuests TEXT,"
              "departureDate TEXT,"
              "arriveDate TEXT,"
              ")");
    });
  }


//створуємо новий об'єкт
  newTrevel(Trevel trevel) async {
    final db = await database;
    var res = await db.insert("Trevel", trevel.toMap());
    return res;
  }
//береро елемент по id
  getTrevel(int id) async {
    final db = await database;
    var res =await  db.query("Trevel", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Trevel.fromMap(res.first) : Null ;
  }
  //беремо всі елементи(вертає список!)
  getAllTrevel() async {
    final db = await database;
    var res = await db.query("Trevel");
    List<Trevel> list =
    res.isNotEmpty ? res.map((c) => Trevel.fromMap(c)).toList() : [];
    return list;
  }
//додати ще якийсь елемент
  updateTrevel(Trevel trevel) async {
    final db = await database;
    var res = await db.update("Trevel", trevel.toMap(),
        where: "id = ?", whereArgs: [trevel.id]);
    return res;
  }
//видалає якійсь елемент
  deleteTrevel(int id) async {
    final db = await database;
    db.delete("Trevel", where: "id = ?", whereArgs: [id]);
  }
//видалає всі елементи
  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Trevel");
  }
}
