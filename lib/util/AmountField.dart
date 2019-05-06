import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class AmountField extends StatelessWidget {
  final TextEditingController controller = new MoneyMaskedTextController(rightSymbol: '€');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      cursorWidth: 0,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      controller: controller,);
  }


}