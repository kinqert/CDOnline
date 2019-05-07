import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/contacts/widgets/ContactSlider.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:cdonline/database/CreditTable.dart';
import 'package:cdonline/database/TransactionTable.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Transaction.dart';
import 'package:cdonline/operations/widgets/OperationDetail.dart';
import 'package:flutter/material.dart';

import '../Credit.dart';

class NewOperationPage extends StatefulWidget {
  final Operation operation;

  NewOperationPage(this.operation, {Key key}) : super(key: key);

  _NewOperationPageState createState() => _NewOperationPageState(operation);
}

class _NewOperationPageState extends State<NewOperationPage> implements ContactSliderDelegate {
  List<Contact> selectedContacts = new List<Contact>();

  bool contactValidate = false;

  Operation operation;

  _NewOperationPageState(this.operation);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContactTable.instance.allContact(),
      builder: (context, snapshot) {
        return Scaffold(
            appBar: AppBar(
                title: Text('New operation'),
                actions: <Widget>[_buildDoneIcon()]),
            body: Container(
              padding: EdgeInsets.only(top: 5, bottom: 20),
              child: Column(
                children: <Widget>[
                  _buildSliderFromSnapshot(context, snapshot),
                  OperationDetail(operation)
                ],
              ),
            ));
      },
    );
  }

  Widget _buildDoneIcon() {
    return IconButton(
        icon: Icon(Icons.done), onPressed: validate() ? _operationDone : null);
  }

  Widget _buildSliderFromSnapshot(
      BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
    if (snapshot.hasData) {
      return Container(
          height: 95, child: ContactSlider(snapshot.data, selectedContacts, this));
    }
    return Text("No contact founded");
  }

  bool validate() {
    return contactValidate && operation.data.amount != 0.0;
  }

  void _operationDone() {
    operation.data.date = DateTime.now();
    if (operation is Credit) {
      for (var contact in selectedContacts) {
        operation.data.contactId = contact.data.id;
        CreditTable.instance.insertCredit(operation.data);
      }
    }

    if (operation is Transaction) {
      for (var contact in selectedContacts) {
        operation.data.contactId = contact.data.id;
        if (contact.creditExist()) {
          (operation.data as TransactionData).creditId = contact.credit.data.id;
          contact.credit.addTransaction(operation);
        }
        TransactionTable.instance.insertTransaction(operation.data);
      }
    }

    Navigator.pop(context, operation);
  }

  @override
  void contactsUpdated() {
    setState(() {
      contactValidate = selectedContacts.length > 0;
    });
  }
}
