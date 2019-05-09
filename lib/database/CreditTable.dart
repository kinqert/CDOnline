import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/database/Table.dart';
import 'package:cdonline/database/TransactionTable.dart';
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
      columnDate: data.date.toUtc().toString(),
      columnDirection: data.direction.index,
      columnDescription: data.description,
    };
  }

  OperationData _createDataFromRow(Map<String, dynamic> row) {
    return OperationData(
        id: row[columnId],
        contactId: row[columnContact],
        amount: row[columnAmount],
        date: DateTime.parse(row[columnDate]),
        direction: OperationDirection.values[row[columnDirection]],
        description: row[columnDescription]);
  }

  Future<Credit> getContactCredit(Contact contact) async {
    // TODO: MUST OPTIMIZED!
    List<Credit> credits = await allCredit();
    credits.retainWhere((credit) => credit.data.contactId == contact.data.id);
    return credits.length > 0 ? credits.last : null;
  }

  Future<List<Credit>> getAllContactCredit(Contact contact) async {
    // TODO: MUST OPTIMIZED!
    List<Credit> credits = await allCredit();
    credits.retainWhere((credit) => credit.data.contactId == contact.data.id);
    return credits;
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
      var credit = Credit(data);
      for (var transaction in await TransactionTable.instance
          .allTransactionFromCredit(credit)) credit.addTransaction(transaction);
      credits.add(credit);
    }

    return credits;
  }

  void updateCredit(OperationData data) async {
    updateData(data, _createRowFromData);
  }

  void deleteCredit(OperationData data) async {
    deleteData(data.id);
  }

  void deleteAllCreditFromContact(Contact contact) async {
    List<Credit> credits = await allCredit();
    credits.retainWhere((credit) => credit.data.contactId == contact.data.id);

    for (var credit in credits) {
      deleteCredit(credit.data);
    }
  }
}
