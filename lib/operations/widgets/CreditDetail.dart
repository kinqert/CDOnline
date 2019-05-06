import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/util/AmountField.dart';
import 'package:cdonline/util/CDSwitch.dart';
import 'package:flutter/material.dart';

import '../Credit.dart';

class CreditDetail extends StatefulWidget {
  final Credit credit;

  CreditDetail(this.credit, {Key key}) : super(key: key);

  _CreditDetailState createState() => _CreditDetailState(credit);
}

class _CreditDetailState extends State<CreditDetail> implements CDSwitchDelegate {
  Credit credit;

  _CreditDetailState(this.credit);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContactTable.instance.allContact(),
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        return Card(
            child: Column(
              children: <Widget>[
                _buildTitle(),
                AmountField(credit),
                CDSwitch(credit, this)
              ],
            ),
        );
      },
    );
  }

  Widget _buildTitle() {
    String textTitle = _switchValue() == true ? 'New Credit' : 'New Debit';
    return Text(textTitle, style: TextStyle(fontWeight: FontWeight.bold),);
  }

  bool _switchValue() {
    return credit.data.direction == OperationDirection.FromUserToContact;
  }

  @override
  void switchChanged(OperationDirection direction) {
    setState(() {
      credit.data.direction = direction;
    });
  }
}