import 'package:test/test.dart';

import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Transaction.dart';
import 'package:cdonline/operations/Debt.dart';

void main() {
  double amount = 15.5;
  DateTime date = DateTime.now();
  OperationDirection direction = OperationDirection.FromContactToUser;
  Debt debt = new Debt(amount, date, OperationDirection.FromContactToUser);

  group('Initialization', (){
    test('debt check init amount', () {
      expect(debt.amount, amount);
    });

    test('debt check init date', () {
      expect(debt.dateTime, date);
    });

    test('debt check init date', () {
      expect(debt.direction, direction);
    });
  });

  group('Debt operations', () {
    test('debt add transaction', (){
      Transaction transaction = new Transaction(amount, date, direction);
      debt.addTransaction(transaction);
      expect(debt.transactions.length, 1);
    });
  });
}