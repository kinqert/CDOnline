import 'package:cdonline/exceptions/DebtExceededException.dart';

import 'Transaction.dart';
import 'Operation.dart';

abstract class CreditDelegate {
  void creditExtinguished();
}

class Credit extends Operation {
  CreditDelegate delegate;

  List<Transaction> transactions = new List<Transaction>();

  Credit({
    int id,
    int contactId,
    int creditId,
    double amount,
    DateTime date,
    String description,
    OperationDirection direction,
  }) : super(
            id: id,
            contactId: contactId,
            amount: amount,
            date: date,
            description: description);

  Credit.newCredit() {
    amount = 0.0;
    direction = OperationDirection.FromUserToContact;
    description = '';
  }

  // TODO: puo essere ottimizzata
  void addTransaction(Transaction transaction) {
    if (isDebtPayed()) {
      throw DebtExceededException("Debt aready payed");
    }
    transactions.add(transaction);
    notifyIfClosed();
  }

  void removeTransaction(Transaction transaction) =>
      transactions.remove(transaction);

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
    if (isDebtPayed()) delegate?.creditExtinguished();
  }
}
