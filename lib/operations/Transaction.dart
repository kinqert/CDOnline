import 'Operation.dart';

class TransactionData extends OperationData {
  int _creditId;

  int get creditId => _creditId;

  set creditId(int value) {
    _creditId = value;
    notifyListeners();
  }

  TransactionData({
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

  TransactionData.newAmount() {
    amount = 0.0;
    direction = OperationDirection.FromUserToContact;
    description = '';
  }
}

class Transaction extends Operation {
  const Transaction(TransactionData data) : super(data);
}
