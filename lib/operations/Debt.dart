import 'Transaction.dart';
import 'Operation.dart';

class Debt implements Operation {
  final double amount;
  final DateTime dateTime;
  final OperationDirection direction;

  List<Transaction> transactions;

  Debt(this.amount, this.dateTime, this.direction);

  @override
  DateTime getDate() {
    return dateTime;
  }

  @override
  double getAmount() {
    return amount;
  }

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  void removeTransaction(Transaction transaction) {
    transactions.remove(transaction);
  }

  Transaction getTransactionAtIndex(int index) {
    return transactions.elementAt(index);
  }

  // Make it not ovveraible
  double getTransactionsTotalPayed() {
    double total = 0;
    for (var transaction in transactions) {
      if (direction == transaction.direction) 
        total -= transaction.amount;
      else
        total += transaction.amount;
    }
    return total;
  }

  double getAmountLeft() {
    return amount - getTransactionsTotalPayed();
  }
}