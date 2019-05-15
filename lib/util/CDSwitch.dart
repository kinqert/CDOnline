import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/util/CDColors.dart';
import 'package:cdonline/util/CDUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DirectionSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OperationData data = Provider.of<OperationData>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(CDUtil.getDirectionNameForOperationData(
            data, OperationDirection.FromUserToContact)),
        Switch(
          activeColor: CDColors.getActiveColorOperationData(data),
          inactiveTrackColor: CDColors.getInactiveTrackColorOperationData(data),
          inactiveThumbColor: CDColors.getInactiveColorOperationData(data),
          value:
              data.direction == OperationDirection.FromContactToUser,
          onChanged: (value) {
            data.direction = value
                ? OperationDirection.FromContactToUser
                : OperationDirection.FromUserToContact;
          },
        ),
        Text(CDUtil.getDirectionNameForOperationData(
            data, OperationDirection.FromContactToUser))
      ],
    );
  }
}
