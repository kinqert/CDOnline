import 'package:test/test.dart';

import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/exceptions/DebtExceededException.dart';
import 'package:cdonline/operations/Transaction.dart';
import 'package:cdonline/operations/Debt.dart';

void main() {
  double amount = 15.5;
  DateTime date = DateTime.now();
  OperationDirection direction = OperationDirection.FromContactToUser;

  group('Initialization', (){
    Debt debt = new Debt(amount, date, direction);

    test('debt check init amount', () {
      expect(debt.amount, amount);
    });

    test('debt check init date', () {
      expect(debt.dateTime, date);
    });

    test('debt check init direction', () {
      expect(debt.direction, direction);
    });
  });

  group('Debt operations', () {
    test('debt add transaction', (){
      Debt debt = new Debt(amount, date, direction);
      Transaction transaction = new Transaction(amount, date, direction);
      debt.addTransaction(transaction);
      expect(debt.transactions.length, 1);
    });

    test('Debt throw Exceeded exception', () {
      Debt debt = new Debt(amount, date, direction);
      Transaction transaction1 = new Transaction(amount, date, OperationDirection.FromUserToContact);
      Transaction transaction2 = new Transaction(amount, date, OperationDirection.FromUserToContact);

      try {
        debt.addTransaction(transaction1);
        debt.addTransaction(transaction2);
        expect(false, true);
      } on DebtExceededException {
        expect(true, true);
      }
    });
  });
}