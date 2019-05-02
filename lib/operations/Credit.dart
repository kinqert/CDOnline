import 'Transaction.dart';
import 'Operation.dart';
import 'package:cdonline/operations/exceptions/DebtExceededException.dart';

abstract class CreditDelegate {
  void creditExtinguished();
}
class Credit extends Operation {
  CreditDelegate delegate;

  List<Transaction> transactions = new List<Transaction>();

  Credit(OperationData data) : super(data);

  // TODO: puo essere ottimizzata
  void addTransaction(Transaction transaction) {
    if (isDebtPayed()) {
      throw DebtExceededException("Debt aready payed");
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
      if (data.direction == transaction.data.direction) 
        total -= transaction.data.amount;
      else
        total += transaction.data.amount;
    }
    return total;
  }

  double getAmountLeft() => data.amount - getTransactionsTotalPayed();

  bool isDebtPayed() => getAmountLeft() <= 0;

  void notifyIfClosed() {
    if (isDebtPayed())
      delegate?.creditExtinguished();
  }
}