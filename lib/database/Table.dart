import 'package:sqflite/sqflite.dart';
import 'DatabaseController.dart';

abstract class Table<T> {
  final String tableName;
  final String columnId;
  Database db;

  Table(this.tableName, this.columnId) {
    loadDb();
  }

  void loadDb() async {
    db = await DatabaseController.instance.database;
  }

  Future<int> _insert(Map<String, dynamic> row) async {
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> _tryQueryAllRows() async {
    try {
      return await _queryAllRows();
    } catch (error) {
      return List<Map<String, dynamic>>();
    }
  }

  Future<List<Map<String, dynamic>>> _queryAllRows() async {
    return await db.query(tableName);
  }

  Future<int> _queryRowCount() async {
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  Future<int> _update(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await db.update(tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> _delete(int id) async {
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  void insert(T data, Function createRowFromData) async {
    Map<String, dynamic> row = createRowFromData(data);
    await _insert(row);
  }

  Future<List<T>> allData(Function createDataFromRow) async {
    List<T> listData = new List<T>();
    final allRows = await _tryQueryAllRows();
    allRows.forEach((row) {
      T data = createDataFromRow(row);
      listData.add(data);
    });
    return listData;
  }

  void updateData(T data, Function createRowFromData) async {
    Map<String, dynamic> row = createRowFromData(data);
    await _update(row);
  }

  void deleteData(int id) async {
    await _delete(id);
  }
}