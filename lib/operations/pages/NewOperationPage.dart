import 'package:cdonline/contacts/widgets/ContactSlider.dart';
import 'package:cdonline/contacts/widgets/SelectedContactListNotifier.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:cdonline/database/CreditTable.dart';
import 'package:cdonline/database/TransactionTable.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Transaction.dart';
import 'package:cdonline/operations/widgets/OperationDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewOperationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => SelectedContactListNotifier(),
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
    return Consumer<SelectedContactListNotifier>(
      builder: (context, listNotifier, _) => Consumer<OperationData>(
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

  bool validate(SelectedContactListNotifier listNotifier, OperationData data) {
    return _contactValidate(listNotifier) && _operationValidate(data);
  }

  bool _contactValidate(SelectedContactListNotifier listNotifier) {
    return listNotifier.selectedContacts.length > 0;
  }

  bool _operationValidate(OperationData data) {
    return data.amount > 0.0;
  }

  void _operationDone(BuildContext context, SelectedContactListNotifier listNotifier) {
    OperationData data = Provider.of<OperationData>(context);

    data.date = DateTime.now();
    if (data is OperationData) {
      for (var contact in listNotifier.selectedContacts) {
        data.contactId = contact.data.id;
        CreditTable.instance.insertCredit(data);
      }
    }

    if (data is TransactionData) {
      for (var contact in listNotifier.selectedContacts) {
        data.contactId = contact.data.id;
        if (contact.creditExist()) {
          data.creditId = contact.credit.data.id;
        }
        TransactionTable.instance.insertTransaction(data);
      }
    }

    Navigator.pop(context);
  }
}
