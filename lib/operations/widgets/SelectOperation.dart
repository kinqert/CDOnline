import 'package:cdonline/operations/Transaction.dart';
import 'package:cdonline/operations/pages/NewOperationPage.dart';
import 'package:cdonline/operations/widgets/OperationTile.dart';
import 'package:flutter/material.dart';

import '../Operation.dart';
import '../Credit.dart';

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
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewOperationPage(
                          Transaction(OperationData.newAmount())))),
            ),
            GestureDetector(
              child: OperationTile(Icons.trending_up, "Add new Credit/Debit",
                  "Create a new Credit or Debit to attach at one or more contact"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewOperationPage(Credit(OperationData.newAmount())))),
            ),
            
          ],
        );
  }
}
