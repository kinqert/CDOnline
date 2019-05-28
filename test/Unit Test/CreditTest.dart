import 'package:cdonline/models/Credit.dart';
import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/models/Transaction.dart';
import 'package:cdonline/exceptions/DebtExceededException.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialAmount = 15.0;
  final initialDirection = OperationDirection.FromUserToContact;
  final initialDescription = "Description";

  Credit credit;
  Transaction t1, t2;

  setUp(() {
    credit = new Credit();
    credit.amount = initialAmount;
    credit.direction = initialDirection;
    credit.description = initialDescription;

    t1 = new Transaction();
    t1.amount = 5.0;
    t1.direction = OperationDirection.FromContactToUser;

    t2 = new Transaction();
    t2.amount = 15.0;
    t2.direction = OperationDirection.FromContactToUser;
  });

  test("Credit init", () {
    expect(credit.amount, initialAmount);
    expect(credit.direction, initialDirection);
    expect(credit.description, initialDescription);
  });

  test("Add transaction", () {
    credit.addTransaction(t1);

    expect(credit.transactions.length, 1);
  });

  test("Throw DebrExceedException", () {
    bool exceptionThrowed = false;
    try {
      credit.addTransaction(t2);
      credit.addTransaction(t1);
    } on DebtExceededException {
      exceptionThrowed = true;
    }
    expect(exceptionThrowed, true);
  });
}
