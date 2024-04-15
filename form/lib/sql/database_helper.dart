// import 'dart:io';

import 'package:form/JSON/users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  final databaseName = "auth.db";
  // static const _dbVersion = 1;
  // static final _tableName = "users";
  // static final _columnId = "id";
  // static final _column1 = "name";
  // static final _column2 = "email";
  // static final _column3 = "number";
  // static final _column4 = "password";
  // static final _column5 = "dateOfBirth";
  // static final _column6 = "gender";

  String user = '''
      CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT UNIQUE,
      password TEXT
       )
      ''';

  static final DatabaseHelper instance = DatabaseHelper();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initiateDatabase();
    return _database;
  }

  Future<Database> initiateDatabase() async {
    // Directory directory = await getApplicationCacheDirectory();
    // String path = join(directory.path, _dbName);
    // return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
    final databasepath = await getDatabasesPath();
    final path = join(databasepath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(user);
    });
  }

  // Future _onCreate(Database db, int version) async {
  //   db.execute('''
  //     CREATE TABLE $_tableName ($_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
  //     $_column1 TEXT,$_column2 TEXT,$_column3 VARCHAR(11),$_column4 TEXT,$_column5 TEXT, $_column6 TEXT)
  //     ''');
  // }

  //Authentication
  Future<bool> authenticate(Users usr) async {
    final Database db = await initiateDatabase();
    var result = await db.rawQuery(
        "select * from users where name = '${usr.name}'AND password = '${usr.password}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //SignUp
  Future<int> createUser(Users usr) async {
    final Database db = await initiateDatabase();
    return db.insert("users", usr.toMap());
  }

  //Get current User details

  Future<Users?> getUser(String name) async {
    final Database db = await initiateDatabase();
    var res = await db.query("users", where: "name = ?", whereArgs: [name]);
    return res.isNotEmpty ? Users.fromMap(res.first) : null;
  }

  // Future<int?> insert(Map<String, dynamic> row) async {
  //   Database? db = await instance.database;
  //   return await db?.insert(_tableName, row);
  // }

  // Future<List<Map<String, Object?>>?> readAll() async {
  //   Database? db = await instance.database;
  //   return await db?.query(_tableName);
  // }

  // Future<int?> update(Map<String, dynamic> row) async {
  //   Database? db = await instance.database;
  //   int id = row[_columnId];
  //   return await db
  //       ?.update(_tableName, row, where: '$_columnId = ?', whereArgs: [id]);
  // }

  // Future<int?> delete(int id) async {
  //   Database? db = await instance.database;

  //   return await db
  //       ?.delete(_tableName, where: '$_columnId = ?', whereArgs: [id]);
  // }
}
