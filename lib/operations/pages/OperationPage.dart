import 'package:cdonline/database/CreditTable.dart';
import 'package:cdonline/operations/widgets/OperationList.dart';
import 'package:cdonline/operations/widgets/SelectOperation.dart';
import 'package:flutter/material.dart';

class OperationPage extends StatefulWidget {
  OperationPage({Key key}) : super(key: key);

  _OperationPageState createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CreditTable.instance.allCredit(),
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
