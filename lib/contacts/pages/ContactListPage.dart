import 'package:cdonline/contacts/ContactData.dart';
import 'package:flutter/material.dart';

import '../widgets/ContactDetail.dart';
import 'package:cdonline/contacts/widgets/ContactList.dart';
import 'package:cdonline/contacts/Contact.dart';

class ContactListPage extends StatelessWidget {
  final List<Contact> contacts;
  const ContactListPage(this.contacts, {Key key}) : super(key: key);

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
                        builder: (context) =>
                            ContactDetail(ContactData.getDefalut())));
              },
            )
          ],
          title: Text("Contact List"),
        ),
        body: ContactList(contacts));
  }
}
