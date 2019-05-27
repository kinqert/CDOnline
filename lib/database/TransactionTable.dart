import 'package:cdonline/database/Table.dart';

import 'package:cdonline/models/Contact.dart';
import 'package:cdonline/models/Credit.dart';
import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/models/Transaction.dart';

class TransactionTable extends Table<Transaction> {
  static final table = 'Transactions';
  static final id = 'id';
  static final columnContact = 'contact';
  static final columnCredit = 'credit';
  static final columnAmount = 'amount';
  static final columnDate = 'date';
  static final columnDirection = 'direction';
  static final columnDescription = 'description';

  static final TransactionTable instance = TransactionTable();

  TransactionTable() : super(table, id);

  static String getCreateString() {
    return '''
          CREATE TABLE $table (
            $id INTEGER PRIMARY KEY,
            $columnContact INTEGER NOT NULL,
            $columnCredit INTEGER,
            $columnAmount DOUBLE,
            $columnDate TEXT,
            $columnDirection INTEGER,
            $columnDescription TEXT
          )
          ''';
  }

  Map<String, dynamic> _createRowFromData(Transaction transaction) {
    return {
      columnId: transaction.id,
      columnContact: transaction.contactId,
      columnCredit: transaction.creditId,
      columnAmount: transaction.amount,
      columnDate: transaction.date.toUtc().toString(),
      columnDirection: transaction.direction.index,
      columnDescription: transaction.description,
    };
  }

  Transaction _createDataFromRow(Map<String, dynamic> row) {
    return Transaction(
        id: row[columnId],
        contactId: row[columnContact],
        creditId: row[columnCredit],
        amount: row[columnAmount],
        date: DateTime.parse(row[columnDate]),
        direction: OperationDirection.values[row[columnDirection]],
        description: row[columnDescription]);
  }

  Future<List<Transaction>> allTransactionFromContact(Contact contact) async {
    List<Transaction> transactions = await allTransactions();
    transactions
        .retainWhere((transaction) => transaction.contactId == contact.id);
    return transactions;
  }

  Future<List<Transaction>> allTransactionFromCredit(Credit credit) async {
    List<Transaction> transactions = await allTransactions();
    transactions
        .retainWhere((transaction) => transaction.creditId == credit.id);
    return transactions;
  }

  void insertTransaction(Transaction data) async {
    insert(data, _createRowFromData);
  }

  Future<List<Transaction>> allTransactions() async {
    List<Transaction> transactions = new List<Transaction>();

    for (Transaction transaction in await allData(_createDataFromRow)) {
      transactions.add(transaction);
    }

    return transactions;
  }

  void updateTransaction(Transaction data) async {
    updateData(data, _createRowFromData);
  }

  void deleteTransaction(Transaction data) async {
    deleteData(data.id);
  }

  void deleteAllTransactionFromContact(Contact contact) async {
    List<Transaction> transactions = await allTransactions();
    transactions
        .retainWhere((transaction) => transaction.contactId == contact.id);

    for (var transaction in transactions) {
      deleteTransaction(transaction);
    }
  }
}
