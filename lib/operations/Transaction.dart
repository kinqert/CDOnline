import 'Operation.dart';

class Transaction implements Operation {
  final DateTime dateTime;
  final double amount;
  final OperationDirection direction;

  const Transaction(this.amount, this.dateTime, this.direction);

  @override
  double getAmount() {
    return amount;
  }

  @override
  DateTime getDate() {
    return dateTime;
  }
}