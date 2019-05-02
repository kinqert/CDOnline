import 'package:cdonline/database/Table.dart';
import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';

class CreditTable extends Table<OperationData> {
  static final table = 'Credits';
  static final id = 'id';
  static final columnContact = 'contact';
  static final columnAmount = 'amount';
  static final columnDate = 'date';
  static final columnDirection = 'direction';
  static final columnDescription = 'description';

  static final CreditTable instance = CreditTable();

  CreditTable() : super(table, id);

  static String getCreateString() {
    return '''
          CREATE TABLE $table (
            $id INTEGER PRIMARY KEY,
            $columnContact INTEGER NOT NULL,
            $columnAmount DOUBLE,
            $columnDate TEXT,
            $columnDirection INTEGER,
            $columnDescription TEXT
          )
          ''';
  }

  Map<String, dynamic> _createRowFromData(OperationData data) {
    return {
      columnId: data.id,
      columnContact: data.contactId,
      columnAmount: data.amount,
      columnDate: data.date,
      columnDirection: data.direction,
      columnDescription: data.description,
    };
  }

  OperationData _createDataFromRow(Map<String, dynamic> row) {
    return OperationData(
        id: row[columnId],
        contactId: row[columnContact],
        amount: row[columnAmount],
        date: row[columnDate],
        direction: row[columnDirection],
        description: row[columnDescription]);
  }

  void insertCredit(OperationData data) async {
    insert(data, _createRowFromData);
  }

  Future<List<OperationData>> allOperationData() async {
    return allData(_createDataFromRow);
  }

  Future<List<Credit>> allCredit() async {
    List<Credit> credits = new List<Credit>();
    
    for (var data in await allOperationData()) {
      credits.add(Credit(data));
    }

    return credits;
  }

  void updateContact(OperationData data) async {
    // row to update
    updateData(data, _createRowFromData);
  }

  void deleteContact(OperationData data) async {
    // Assuming that the number of rows is the id for the last row.
    deleteData(data.id);
  }
}
