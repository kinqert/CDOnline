import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/util/AmountField.dart';
import 'package:cdonline/util/CDSwitch.dart';
import 'package:flutter/material.dart';

import '../Credit.dart';

class OperationDetail extends StatefulWidget {
  final Operation operation;

  OperationDetail(this.operation, {Key key}) : super(key: key);

  _OperationDetailState createState() => _OperationDetailState(operation);
}

class _OperationDetailState extends State<OperationDetail>
    implements CDSwitchDelegate {
  Operation operation;

  _OperationDetailState(this.operation);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContactTable.instance.allContact(),
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        return Card(
          child: Column(
            children: <Widget>[
              _buildTitle(),
              AmountField(operation),
              DirectionSwitch(operation, this)
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    String textTitle;
    if (operation is Credit)
      textTitle = _switchValue() == true ? 'New Credit' : 'New Debit';
    else
      textTitle = 'New Transaction';

    return Container(
        padding: EdgeInsets.all(20),
        child: Text(
          textTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }

  bool _switchValue() {
    return operation.data.direction == OperationDirection.FromUserToContact;
  }

  @override
  void switchChanged(OperationDirection direction) {
    setState(() {
      operation.data.direction = direction;
    });
  }
}
