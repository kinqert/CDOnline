import 'package:flutter/material.dart';

import 'package:cdonline/models/Contact.dart';
import 'package:cdonline/widgets/contacts/ContactDetail.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:provider/provider.dart';

class NewContactPage extends StatelessWidget {
  final Contact contact = Contact.getDefalut();

  @override
  Widget build(BuildContext context) {
    return Provider<Contact>(
        builder: (BuildContext context) => contact,
        child: Scaffold(
          appBar: AppBar(
            title: Text('New Contact'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.done),
                onPressed: () {
                  ContactTable.instance.insertContact(contact);
                  Navigator.pop(context, contact);
                },
              )
            ],
          ),
          body: ContactDetail(),
        ));
  }
}
