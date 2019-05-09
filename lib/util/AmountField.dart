import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/util/CDColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class AmountField extends StatelessWidget {
  final Operation operation;
  final controller = new MoneyMaskedTextController(rightSymbol: '€');
  final Function onAmountChange;

  AmountField(this.operation, {this.onAmountChange});

  @override
  Widget build(BuildContext context) {
    controller.updateValue(0.0);
    controller.addListener(_amountSetted);

    var border = UnderlineInputBorder(borderSide: BorderSide(color: CDColors.getOperationColor(operation)));

    return Container(child: TextField(
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border,
        border: border),
      cursorWidth: 0,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.numberWithOptions(),
      controller: controller,),);
  }

  void _amountSetted() {
    onAmountChange(controller.numberValue);
  }
}