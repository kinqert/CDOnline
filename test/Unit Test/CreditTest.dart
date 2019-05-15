import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Transaction.dart';
import 'package:cdonline/operations/exceptions/DebtExceededException.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialAmount = 15.0;
  final initialDirection = OperationDirection.FromUserToContact;
  final initialDescription = "Description";

  Credit credit;

  setUp(() {
    credit = new Credit(
      OperationData(
          amount: initialAmount,
          direction: initialDirection,
          description: initialDescription),
    );
  });

  test("Credit init", () {
    expect(credit.data.amount, initialAmount);
    expect(credit.data.direction, initialDirection);
    expect(credit.data.description, initialDescription);
  });

  test("Add transaction", () {
    Transaction t = new Transaction(TransactionData(
        amount: 5.0, direction: OperationDirection.FromContactToUser));
    
    credit.addTransaction(t);

    expect(credit.transactions.length, 1);
  });

  test("Throw DebrExceedException", () {
    Transaction t1 = new Transaction(TransactionData(
        amount: 15.0, direction: OperationDirection.FromContactToUser));
    Transaction t2 = new Transaction(TransactionData(
        amount: 5.0, direction: OperationDirection.FromContactToUser));
    bool exceptionThrowed = false;
    try{
      credit.addTransaction(t1);
      credit.addTransaction(t2);
    } on DebtExceededException {
      exceptionThrowed = true;
    }
    expect(exceptionThrowed, true);
  });
}
