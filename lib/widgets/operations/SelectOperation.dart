import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cdonline/models/Credit.dart';
import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/models/Transaction.dart';
import 'package:cdonline/pages/NewOperationPage.dart';

import 'OperationTile.dart';

class SelectOperation extends StatelessWidget {
  const SelectOperation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: OperationTile(Icons.attach_money, "Add new Transaction",
              "Create a new Transaction to be attached to a debit or contact"),
          onTap: () => {_onTap(context, 0)},
        ),
        GestureDetector(
            child: OperationTile(Icons.trending_up, "Add new Credit/Debit",
                "Create a new Credit or Debit to attach at one or more contact"),
            onTap: () => {_onTap(context, 1)}),
      ],
    );
  }

  void _onTap(BuildContext context, int index) {
    var page = ChangeNotifierProvider<Operation>(
      builder: (context) => index == 0
          ? Transaction.newTransaction()
          : Credit.newCredit(),
      child: NewOperationPage(),
    );

    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
