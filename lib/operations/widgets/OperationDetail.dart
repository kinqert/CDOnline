import 'package:flutter/material.dart';

import 'package:cdonline/operations/widgets/OperationTitle.dart';
import 'package:cdonline/util/AmountField.dart';
import 'package:cdonline/util/CDSwitch.dart';

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
