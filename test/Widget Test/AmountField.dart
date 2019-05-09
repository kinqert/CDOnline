import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Transaction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:cdonline/util/AmountField.dart';

void main() {
  Operation operation;
  AmountField field;

  setUp(() {
    field = AmountField(operation);
    operation = new Transaction(TransactionData.newAmount());
  });

  testWidgets("Amount init", (WidgetTester tester) async {
    await tester.pumpWidget(field);

    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets("Amount update", (WidgetTester tester) async {
    bool amountChanged = false;
    field = AmountField(operation, onAmountChange: (double amount) {
      amountChanged = true;
    },);

    await tester.pumpWidget(field);

    await tester.enterText(find.byType(TextField), "1500");

    expect(amountChanged, true);
  });
}