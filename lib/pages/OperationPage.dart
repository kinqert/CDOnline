import 'package:flutter/material.dart';

import 'package:cdonline/database/OperationTable.dart';
import 'package:cdonline/widgets/operations/OperationList.dart';
import 'package:cdonline/widgets/operations/SelectOperation.dart';

class OperationPage extends StatefulWidget {
  OperationPage({Key key}) : super(key: key);

  _OperationPageState createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: OperationTable.getAllOperations(),
      builder: (context, snapshot) {
        Widget operationList = Text("No operation Founded");

        if (snapshot.hasData) {
          operationList = OperationList(snapshot.data);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Operations"),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                SelectOperation(),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text("Last operations:"),
                ),
                Expanded(child: operationList),
              ],
            ),
          ),
        );
      },
    );
  }
}
