import 'package:flutter/material.dart';
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
      contacts.add(Contact.getDefault());
    }

    return contacts;
  }
}
