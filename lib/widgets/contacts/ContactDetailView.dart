import 'package:flutter/material.dart';

import 'package:cdonline/models/Contact.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:cdonline/util/CDColors.dart';
import 'package:provider/provider.dart';

import 'ContactDetail.dart';

class ContactDetailView extends StatefulWidget {
  final Contact contact;
  const ContactDetailView(this.contact, {Key key}) : super(key: key);

  _ContactDetailViewState createState() => _ContactDetailViewState();
}

class _ContactDetailViewState extends State<ContactDetailView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ContactDetail(),
          ),
          RaisedButton(
            color: Theme.of(context).errorColor,
            onPressed: _deleteContact,
            child: Text('Delete Contact'),
          )
        ],
      ),
    );
  }

  void _deleteContact() {
    showDialog(
        context: context,
        builder: (context) {
          Contact contact = Provider.of<Contact>(context);
          return AlertDialog(
            title: Text("Delete this contact?"),
            content: Text(
                "It'll be deleted also all Credits, Debts and Transactions done with this contact."),
            actions: <Widget>[
              FlatButton(
                  child: Text(
                    "Delete",
                    style: TextStyle(color: CDColors.red),
                  ),
                  onPressed: () {
                    ContactTable.instance.deleteContact(contact);
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  }),
              FlatButton(
                child: Text("Cancel"),
                onPressed: Navigator.of(context).pop,
              ),
            ],
          );
        });
  }
}
