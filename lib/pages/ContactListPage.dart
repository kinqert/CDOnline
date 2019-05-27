import 'package:flutter/material.dart';

import 'package:cdonline/pages/NewContactPage.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:cdonline/widgets/contacts/ContactList.dart';
import 'package:cdonline/models/Contact.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatefulWidget {
  ContactListPage({Key key}) : super(key: key);

  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<Contact> contacts = new List<Contact>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ContactTable.instance.allContact(),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          _buildDataOnSnapshot(snapshot);
          return _buildPageOnSnapshot(context, snapshot);
        });
  }

  void _buildDataOnSnapshot(AsyncSnapshot<List<Contact>> snapshot) {
    if (snapshot.hasData) contacts = snapshot.data;
  }

  Widget _buildPageOnSnapshot(
      BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
                newContactTap(context);
              },
            )
          ],
          title: Text("Contact List"),
        ),
        body: _buildBodyOnSnapshot(context, snapshot));
  }

  Widget _buildBodyOnSnapshot(
      BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
    if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError)
      return Provider<List<Contact>>(
        builder: (BuildContext context) => snapshot.data,
        child: ContactList());

    return Center(child: Text("No contacts founded."));
  }

  void newContactTap(BuildContext context) async {
    final Contact newContact = await Navigator.push<Contact>(
        context, MaterialPageRoute(builder: (context) => NewContactPage()));
    setState(() {
      contacts.add(newContact);
    });
  }
}
