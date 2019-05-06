import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:flutter/material.dart';

class CDSwitch extends StatefulWidget {
  final Credit credit;

  CDSwitch(this.credit, {Key key}) : super(key: key);

  _CDSwitchState createState() => _CDSwitchState(credit);
}

class _CDSwitchState extends State<CDSwitch> {
  Credit credit;

  _CDSwitchState(this.credit);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Credit'),
        Switch(
          activeColor: theme.hintColor,
          inactiveTrackColor: Colors.red[800],
          inactiveThumbColor: theme.errorColor,
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
    setState(() {
      credit.data.direction =
          credit.data.direction == OperationDirection.FromUserToContact
              ? OperationDirection.FromContactToUser
              : OperationDirection.FromUserToContact;
    });
  }
}
