import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/util/CDColors.dart';

class AmountField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Operation operation = Provider.of<Operation>(context);
    final MoneyMaskedTextController controller = new MoneyMaskedTextController(
      rightSymbol: '€',
      initialValue: operation.amount,
    );

    controller.addListener(() => operation.amount = controller.numberValue);

    var border = UnderlineInputBorder(
        borderSide: BorderSide(color: CDColors.getOperationColor(operation)));

    return Container(
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: border, focusedBorder: border, border: border),
        cursorWidth: 0,
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.numberWithOptions(),
        controller: controller,
      ),
    );
  }
}
