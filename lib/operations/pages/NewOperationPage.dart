import 'package:flutter/material.dart';

import '../Operation.dart';
import '../Credit.dart';
import '../Transaction.dart';

class NewOperationPage extends StatelessWidget {
  const NewOperationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("New Operation"),
        ),
        body: Center(
          child: Text("New operation page"),
        ),
      ),
    );
  }
}