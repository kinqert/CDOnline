import 'Operation.dart';

class TransactionData extends OperationData {
  int creditId;

  TransactionData({id, contactId, this.creditId, amount, date, direction, description}) 
    : super(id: id, contactId: contactId, amount: amount, date: date, direction: direction, description: description);

  TransactionData.newAmount() {
    amount = 0.0;
    direction = OperationDirection.FromUserToContact;
    description = '';
  }
}

class Transaction extends Operation {
  const Transaction(TransactionData data) : super(data);
}