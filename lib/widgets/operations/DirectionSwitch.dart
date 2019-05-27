import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/util/CDColors.dart';
import 'package:cdonline/util/CDUtil.dart';

class DirectionSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Operation operation = Provider.of<Operation>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(CDUtil.getDirectionNameForOperation(
            operation, OperationDirection.FromUserToContact)),
        Switch(
          activeColor: CDColors.getActiveColorOperation(operation),
          inactiveTrackColor: CDColors.getInactiveTrackColorOperation(operation),
          inactiveThumbColor: CDColors.getInactiveColorOperation(operation),
          value:
              operation.direction == OperationDirection.FromContactToUser,
          onChanged: (value) {
            operation.direction = value
                ? OperationDirection.FromContactToUser
                : OperationDirection.FromUserToContact;
          },
        ),
        Text(CDUtil.getDirectionNameForOperation(
            operation, OperationDirection.FromContactToUser))
      ],
    );
  }
}
