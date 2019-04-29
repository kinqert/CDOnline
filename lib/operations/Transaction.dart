import 'Operation.dart';

class Transaction implements Operation {
  final DateTime dateTime;
  final double amount;
  final OperationDirection direction;

  const Transaction(this.dateTime, this.amount, this.direction);

  @override
  double getAmount() {
    return amount;
  }

  @override
  DateTime getDate() {
    return dateTime;
  }
}