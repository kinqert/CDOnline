import 'package:cdonline/operations/pages/NewOperationPage.dart';
import 'package:cdonline/operations/widgets/OperationTile.dart';
import 'package:flutter/material.dart';

import '../Operation.dart';
import '../Credit.dart';

class SelectOperationPage extends StatelessWidget {
  const SelectOperationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("New Operation"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: OperationTile(Icons.trending_up, "Add new Credit/Debit",
                  "Create a new Credit or Debit to attach at one or more contact"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewOperationPage(Credit(OperationData())))),
            )
          ],
        ),
      ),
    );
  }
}
