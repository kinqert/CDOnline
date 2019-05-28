import 'package:cdonline/database/Table.dart';
import 'package:cdonline/database/TransactionTable.dart';

import 'package:cdonline/models/Contact.dart';
import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/models/Credit.dart';

class CreditTable extends Table<Credit> {
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

  Map<String, dynamic> _createRowFromData(Credit credit) {
    return {
      columnId: credit.id,
      columnContact: credit.contactId,
      columnAmount: credit.amount,
      columnDate: credit.date.toUtc().toString(),
      columnDirection: credit.direction.index,
      columnDescription: credit.description,
    };
  }

  Credit _createDataFromRow(Map<String, dynamic> row) {
    Credit credit = Credit();
    credit.id = row[columnId];
    credit.contactId = row[columnContact];
    credit.amount = row[columnAmount];
    credit.date = DateTime.parse(row[columnDate]);
    credit.direction = OperationDirection.values[row[columnDirection]];
    credit.description = row[columnDescription];
    return credit;
  }

  Future<Credit> getContactCredit(Contact contact) async {
    // TODO: MUST OPTIMIZED!
    List<Credit> credits = await allCredit();
    credits.retainWhere((credit) => credit.contactId == contact.id);
    return credits.length > 0 ? credits.last : null;
  }

  Future<List<Credit>> getAllContactCredit(Contact contact) async {
    // TODO: MUST OPTIMIZED!
    List<Credit> credits = await allCredit();
    credits.retainWhere((credit) => credit.contactId == contact.id);
    return credits;
  }

  void insertCredit(Credit credit) async {
    insert(credit, _createRowFromData);
  }

  Future<List<Credit>> allCredit() async {
    List<Credit> credits = new List<Credit>();

    for (Credit credit in await allData(_createDataFromRow)) {
      for (var transaction in await TransactionTable.instance
          .allTransactionFromCredit(credit)) credit.addTransaction(transaction);
      credits.add(credit);
    }

    return credits;
  }

  void updateCredit(Credit credit) async {
    updateData(credit, _createRowFromData);
  }

  void deleteCredit(Credit credit) async {
    deleteData(credit.id);
  }

  void deleteAllCreditFromContact(Contact contact) async {
    List<Credit> credits = await allCredit();
    credits.retainWhere((credit) => credit.contactId == contact.id);

    for (var credit in credits) {
      deleteCredit(credit);
    }
  }
}
