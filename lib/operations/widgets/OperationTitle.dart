import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Operation.dart';

class OperationTitle extends StatelessWidget {
  const OperationTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OperationData data = Provider.of<OperationData>(context);
    
    String textTitle;
    if (data is OperationData)
      textTitle = data.direction == OperationDirection.FromUserToContact ? 'New Credit' : 'New Debit';
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