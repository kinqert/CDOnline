import 'package:cdonline/contacts/ContactData.dart';
import 'package:cdonline/contacts/pages/ContactTabController.dart';
import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:flutter/material.dart';

import 'package:cdonline/contacts/widgets/ContactList.dart';
import 'package:cdonline/contacts/Contact.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactTabController(
                            new Contact(ContactData.getDefalut()))));
              },
            )
          ],
          title: Text("Contact List"),
        ),
        body: ContactList(_createMokupContacts(15)));
  }

  List<Contact> _createMokupContacts(int numberOfContact) {
    List<Contact> contacts = new List<Contact>();

    for (int i = 0; i < numberOfContact; i++) {
      ContactData data = ContactData.getDefalut();
      Contact newContact = Contact(data);
      Credit newCredit = new Credit(
          15.5, DateTime.now(), OperationDirection.FromUserToContact);
      newContact.setCredit(newCredit);
      contacts.add(newContact);
    }

    return contacts;
  }
}
