import 'package:flutter/material.dart';

import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/contacts/widgets/ContactList.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = _createMokupContacts(10);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: Text("CD Online"),),
      body: ContactList(contacts)
    );
  }

  List<Contact> _createMokupContacts(int numberOfContact) {
    List<Contact> contacts = new List<Contact>();

    for (int i = 0; i < numberOfContact; i++) {
      Contact newContact = Contact.getDefault();
      Credit newCredit = new Credit(15.5, DateTime.now(), OperationDirection.FromContactToUser);
      newContact.setCredit(newCredit);
      contacts.add(newContact);
    }

    return contacts;
  }
}
