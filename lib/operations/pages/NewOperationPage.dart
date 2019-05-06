import 'package:cdonline/contacts/ContactData.dart';
import 'package:cdonline/contacts/widgets/ContactSlider.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/widgets/CreditDetail.dart';
import 'package:flutter/material.dart';

import '../Credit.dart';

class NewOperationPage extends StatefulWidget {
  final Operation operation;

  NewOperationPage(this.operation, {Key key}) : super(key: key);

  _NewOperationPageState createState() => _NewOperationPageState(operation);
}

class _NewOperationPageState extends State<NewOperationPage> {
  bool operationValidated = false;
  Operation operation;

  _NewOperationPageState(this.operation);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContactTable.instance.allContactData(),
      builder: (context, snapshot) {
        return Scaffold(
            appBar: AppBar(title: Text('New operation'), actions: <Widget>[_buildDoneIcon()]),
            body: Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  _buildSliderFromSnapshot(context, snapshot),
                  _buildOperationFromOperation()
                ],
              ),
            ));
      },
    );
  }

  Widget _buildDoneIcon() {
    return IconButton(
        icon: Icon(Icons.done),
        onPressed: operationValidated ? _operationDone : null);
  }

  Widget _buildSliderFromSnapshot(
      BuildContext context, AsyncSnapshot<List<ContactData>> snapshot) {
    if (snapshot.hasData) {
      return Container(height: 95, child: ContactSlider(snapshot.data));
    }
    return Text("No contact founded");
  }

  Widget _buildOperationFromOperation() {
    if (operation is Credit) return CreditDetail(operation);
    return Text("This operation is not supported yet");
  }

  void _operationDone() {}
}
