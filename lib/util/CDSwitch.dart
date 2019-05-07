import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:flutter/material.dart';

abstract class CDSwitchDelegate {
  void switchChanged(OperationDirection direction);
}

class DirectionSwitch extends StatelessWidget {
  final Operation operation;
  final CDSwitchDelegate delegate;

  const DirectionSwitch(this.operation, this.delegate);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return _buildSwitch(theme);
  }

  Widget _buildSwitch(ThemeData theme) {
    if (operation is Credit)
      return _builCreditSwitch(theme);
    else
      return _buildTransactionSwitch(theme);
  }

  Widget _buildTransactionSwitch(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Given'),
        Switch(
          activeColor: theme.hintColor,
          inactiveTrackColor: Colors.red[800],
          inactiveThumbColor: theme.errorColor,
          value: _switchValue(),
          onChanged: _directionChanged,
        ),
        Text('Recived')
      ],
    );
  }

  Widget _builCreditSwitch(ThemeData theme) {
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
    return operation.data.direction == OperationDirection.FromContactToUser;
  }

  void _directionChanged(bool value) {
    var direction =
        operation.data.direction == OperationDirection.FromUserToContact
            ? OperationDirection.FromContactToUser
            : OperationDirection.FromUserToContact;
    delegate?.switchChanged(direction);
  }
}
