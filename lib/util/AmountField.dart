import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/util/CDColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class AmountField extends StatefulWidget {
  final OperationData data;
  AmountField(this.data, {Key key}) : super(key: key);

  _AmountFieldState createState() => _AmountFieldState(data);
}

class _AmountFieldState extends State<AmountField> {
  MoneyMaskedTextController controller;
  OperationData data;

  _AmountFieldState(this.data) {
    controller = new MoneyMaskedTextController(initialValue: data.amount, rightSymbol: '€');
    controller.addListener(_amountSetted);
  }

  @override
  Widget build(BuildContext context) {
    var border = UnderlineInputBorder(borderSide: BorderSide(color: CDColors.getDirectionColor(data)));

    return TextField(
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border,
        border: border),
      cursorWidth: 0,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      controller: controller,);
  }

  void _amountSetted() {
    setState(() {
      data.amount = controller.numberValue;
    });
  }
}