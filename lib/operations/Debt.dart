import 'Transaction.dart';
import 'Operation.dart';
import 'DebtDelegate.dart';
import 'package:cdonline/exceptions/DebtExceededException.dart';

class Debt implements Operation {
  final double amount;
  final DateTime dateTime;
  final OperationDirection direction;
  DebtDelegate delegate;

  List<Transaction> transactions = new List<Transaction>();

  Debt(this.amount, this.dateTime, this.direction);

  @override
  DateTime getDate() => dateTime;

  @override
  double getAmount() => amount;

  // TODO: puo essere ottimizzata
  void addTransaction(Transaction transaction) {
    if (isDebtPayed()) {
      throw new DebtExceededException("Debt aready payed");
    }
    transactions.add(transaction);
    notifyIfClosed();
  }

  void removeTransaction(Transaction transaction) => transactions.remove(transaction);

  Transaction getTransactionAtIndex(int index) => transactions.elementAt(index);

  // TODO: Make it not ovveraible
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

  double getAmountLeft() => amount - getTransactionsTotalPayed();

  bool isDebtPayed() => getAmountLeft() <= 0;

  void notifyIfClosed() {
    if (isDebtPayed())
      delegate?.debtExtinguished();
  }
}