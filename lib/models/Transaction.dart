import 'Operation.dart';

class Transaction extends Operation {
  int _creditId;

  int get creditId => _creditId;

  set creditId(int value) {
    _creditId = value;
    notifyListeners();
  }

  Transaction({
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
            description: description) {
    this._creditId = creditId;
  }

  Transaction.newAmount() {
    amount = 0.0;
    direction = OperationDirection.FromUserToContact;
    description = '';
  }
}
