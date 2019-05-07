import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/util/CDColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class AmountField extends StatefulWidget {
  final Operation operation;
  AmountField(this.operation, {Key key}) : super(key: key);

  _AmountFieldState createState() => _AmountFieldState(operation);
}

class _AmountFieldState extends State<AmountField> {
  MoneyMaskedTextController controller;
  Operation operation;

  _AmountFieldState(this.operation) {
    controller = new MoneyMaskedTextController(initialValue: operation.data.amount, rightSymbol: '€');
    controller.addListener(_amountSetted);
  }

  @override
  Widget build(BuildContext context) {
    var border = UnderlineInputBorder(borderSide: BorderSide(color: CDColors.getOperationColor(operation)));

    return TextField(
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border,
        border: border),
      cursorWidth: 0,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      controller: controller,);
  }

  void _amountSetted() {
    setState(() {
      operation.data.amount = controller.numberValue;
    });
  }
}