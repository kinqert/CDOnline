import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:flutter/material.dart';

abstract class CDSwitchDelegate {
  void switchChanged(OperationDirection direction);
}

class CDSwitch extends StatelessWidget {
  final Credit credit;
  final CDSwitchDelegate delegate;

  const CDSwitch(this.credit, this.delegate);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Credit'),
        Switch(
          activeColor: theme.errorColor,
          inactiveTrackColor: Colors.green[800],
          inactiveThumbColor: theme.hintColor,
          value: _switchValue(),
          onChanged: _directionChanged,
        ),
        Text('Debt')
      ],
    );
  }

  bool _switchValue() {
    return credit.data.direction == OperationDirection.FromContactToUser;
  }

  void _directionChanged(bool value) {
    var direction =
        credit.data.direction == OperationDirection.FromUserToContact
            ? OperationDirection.FromContactToUser
            : OperationDirection.FromUserToContact;
    delegate?.switchChanged(direction);
  }
}
