import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/util/CDColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

class AmountField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OperationData data = Provider.of<OperationData>(context);
    final MoneyMaskedTextController controller = new MoneyMaskedTextController(
      rightSymbol: '€',
      initialValue: data.amount,
    );

    controller.addListener(() => data.amount = controller.numberValue);

    var border = UnderlineInputBorder(
        borderSide: BorderSide(color: CDColors.getOperationDataColor(data)));

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
