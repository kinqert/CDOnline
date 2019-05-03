import 'package:cdonline/contacts/pages/NewContactPage.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/pacman_indicator.dart';

import 'package:cdonline/contacts/widgets/ContactList.dart';
import 'package:cdonline/contacts/Contact.dart';

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
    if (snapshot.hasData)
        contacts += snapshot.data;
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
    Widget loadingWidget = Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Loading(indicator: PacmanIndicator(), size: 100.0),
        ));

    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return Text("Connection not active");
      case ConnectionState.waiting:
        return loadingWidget;
      case ConnectionState.active:
        return loadingWidget;
      case ConnectionState.done:
        if (!snapshot.hasError) return ContactList(snapshot.data);
    }

    return Text("Errore durante il caricamento dei dati");
  }

  void newContactTap(BuildContext context) async {
    final Contact newContact = await Navigator.push<Contact>(
        context, MaterialPageRoute(builder: (context) => NewContactPage()));
    setState(() {
        contacts.add(newContact);
    });
  }
}
