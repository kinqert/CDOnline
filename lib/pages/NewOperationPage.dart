import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cdonline/database/ContactTable.dart';
import 'package:cdonline/database/CreditTable.dart';
import 'package:cdonline/database/TransactionTable.dart';

import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/models/Transaction.dart';
import 'package:cdonline/models/Credit.dart';

import 'package:cdonline/widgets/contacts/ContactSlider.dart';
import 'package:cdonline/scoped_models/SelectedContactListNotifier.dart';
import 'package:cdonline/widgets/operations/OperationDetail.dart';

class NewOperationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => SelectedContactModel(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
                'New operation'),
            actions: <Widget>[_buildDoneIcon(context)]),
        body: Container(
          padding: EdgeInsets.only(top: 5, bottom: 20),
          child: Column(
            children: <Widget>[_buildSliderFromSnapshot(), OperationDetail()],
          ),
        ),
      ),
    );
  }

  Widget _buildDoneIcon(BuildContext context) {
    return Consumer<SelectedContactModel>(
      builder: (context, listNotifier, _) => Consumer<Operation>(
            builder: (context, operation, _) => IconButton(
                icon: Icon(Icons.done),
                onPressed:
                    validate(listNotifier, operation) ? () => _operationDone(context, listNotifier) : null),
          ),
    );
  }

  Widget _buildSliderFromSnapshot() {
    return FutureBuilder(
        future: ContactTable.instance.allContact(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(height: 95, child: ContactSlider(snapshot.data));
          }
          return Text("No contact founded");
        });
  }

  bool validate(SelectedContactModel listNotifier, Operation operation) {
    return _contactValidate(listNotifier) && _operationValidate(operation);
  }

  bool _contactValidate(SelectedContactModel listNotifier) {
    return listNotifier.selectedContacts.length > 0;
  }

  bool _operationValidate(Operation operation) {
    return operation.amount > 0.0;
  }

  void _operationDone(BuildContext context, SelectedContactModel listNotifier) {
    Operation operation = Provider.of<Operation>(context);

    operation.date = DateTime.now();
    if (operation is Credit) {
      for (var contact in listNotifier.selectedContacts) {
        operation.contactId = contact.id;
        CreditTable.instance.insertCredit(operation);
      }
    }

    if (operation is Transaction) {
      for (var contact in listNotifier.selectedContacts) {
        operation.contactId = contact.id;
        if (contact.creditExist()) {
          operation.creditId = contact.credit.id;
        }
        TransactionTable.instance.insertTransaction(operation);
      }
    }

    Navigator.pop(context);
  }
}
