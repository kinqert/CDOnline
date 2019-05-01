import 'package:cdonline/contacts/ContactData.dart';
import 'package:sqflite/sqflite.dart';

import 'DatabaseController.dart';

class ContactTable {
  static final table = 'contacts';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnLastname = 'lastname';
  static final columnPhone = 'phone';
  static final columnAddress = 'address';
  static final columnNote = 'note';

  static String getCreateString() {
    return '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnLastname TEXT,
            $columnPhone TEXT,
            $columnAddress TEXT,
            $columnNote TEXT
          )
          ''';
  }

  static Future<int> _insert(Map<String, dynamic> row) async {
    Database db = await DatabaseController.instance.database;
    return await db.insert(table, row);
  }

  static Future<List<Map<String, dynamic>>> _queryAllRows() async {
    Database db = await DatabaseController.instance.database;
    return await db.query(table);
  }

  static Future<int> _queryRowCount() async {
    Database db = await DatabaseController.instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  static Future<int> _update(Map<String, dynamic> row) async {
    Database db = await DatabaseController.instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  static Future<int> _delete(int id) async {
    Database db = await DatabaseController.instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  static Map<String, dynamic> _createRowFromData(ContactData data) {
    return {
      columnName: data.name,
      columnLastname: data.lastName,
      columnPhone: data.phone,
      columnAddress: data.address,
      columnNote: data.note,
    };
  }

  static void insert(ContactData data) async {
    // row to insert
    Map<String, dynamic> row = _createRowFromData(data);
    final id = await _insert(row);
    print('inserted row id: $id');
  }

  static Future<List<ContactData>> allContact() async {
    List<ContactData> contacts = new List<ContactData>();
    final allRows = await _queryAllRows();
    print('query all rows:');
    allRows.forEach((row) {
      ContactData data = ContactData(
          name: row[columnName],
          lastName: row[columnLastname],
          phone: row[columnPhone],
          address: row[columnAddress],
          note: row[columnNote]);
      contacts.add(data);
    });
    return contacts;
  }

  static void update(ContactData data) async {
    // row to update
    Map<String, dynamic> row = _createRowFromData(data);
    final rowsAffected = await _update(row);
    print('updated $rowsAffected row(s)');
  }

  static void delete(ContactData data) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await _delete(data.id);
    print('deleted $rowsDeleted row(s): row ${data.id}');
  }
}
