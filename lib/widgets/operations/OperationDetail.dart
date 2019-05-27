import 'package:flutter/material.dart';

import 'AmountField.dart';
import 'DirectionSwitch.dart';
import 'OperationTitle.dart';

class OperationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        OperationTitle(),
        AmountField(),
        DirectionSwitch()
      ],
    ));
  }
}
