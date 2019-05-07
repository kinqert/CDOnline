import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/database/Table.dart';
import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Transaction.dart';

class TransactionTable extends Table<TransactionData> {
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

  Map<String, dynamic> _createRowFromData(TransactionData data) {
    return {
      columnId: data.id,
      columnContact: data.contactId,
      columnCredit: data.creditId,
      columnAmount: data.amount,
      columnDate: data.date.toUtc().toString(),
      columnDirection: data.direction.index,
      columnDescription: data.description,
    };
  }

  TransactionData _createDataFromRow(Map<String, dynamic> row) {
    return TransactionData(
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
    transactions.retainWhere(
        (transaction) => transaction.data.contactId == contact.data.id);
    return transactions;
  }

  Future<List<Transaction>> allTransactionFromCredit(Credit credit) async {
    List<Transaction> transactions = await allTransactions();
    transactions.retainWhere((transaction) =>
        (transaction.data as TransactionData).creditId == credit.data.id);
    return transactions;
  }

  void insertTransaction(TransactionData data) async {
    insert(data, _createRowFromData);
  }

  Future<List<TransactionData>> allTransactionData() async {
    return allData(_createDataFromRow);
  }

  Future<List<Transaction>> allTransactions() async {
    List<Transaction> transactions = new List<Transaction>();

    for (var data in await allTransactionData()) {
      transactions.add(Transaction(data));
    }

    return transactions;
  }

  void updateTransaction(TransactionData data) async {
    // row to update
    updateData(data, _createRowFromData);
  }

  void deleteTransaction(TransactionData data) async {
    // Assuming that the number of rows is the id for the last row.
    deleteData(data.id);
  }

  void deleteAllTransactionFromContact(Contact contact) async {
    List<Transaction> transactions = await allTransactions();
    transactions.retainWhere((transaction) => transaction.data.contactId == contact.data.id);

    for (var transaction in transactions) {
      deleteTransaction(transaction.data);
    }
  }
}
