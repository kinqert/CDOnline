import 'dart:io';

import 'package:cdonline/database/ContactTable.dart';
import 'package:cdonline/database/CreditTable.dart';
import 'package:cdonline/database/TransactionTable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseController {
  static final _databaseName = "CDOnlineDatabase.db";
  static final _databaseVersion = 1;

  DatabaseController._privateConstructor();
  static final DatabaseController instance = DatabaseController._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }
  
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
    await db.execute(TransactionTable.getCreateString());
  }
}