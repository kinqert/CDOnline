import 'dart:io';

import 'package:cdonline/database/ContactTable.dart';
import 'package:cdonline/database/OperationTable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseController {
  
  static final _databaseName = "CDOnlineDatabase.db";
  static final _databaseVersion = 1;

  // make this a singleton class
  DatabaseController._privateConstructor();
  static final DatabaseController instance = DatabaseController._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }
  
  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(ContactTable.getCreateString());
    await db.execute(CreditTable.getCreateString());
  }
}