import 'package:cdonline/models/Credit.dart';
import 'package:cdonline/models/Operation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperationTitle extends StatelessWidget {
  const OperationTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Operation operation = Provider.of<Operation>(context);

    String textTitle;
    if (operation is Credit)
      textTitle =
          operation.direction == OperationDirection.FromUserToContact
              ? 'New Credit'
              : 'New Debit';
    else
      textTitle = 'New Transaction';

    return Container(
        padding: EdgeInsets.all(20),
        child: Text(
          textTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
