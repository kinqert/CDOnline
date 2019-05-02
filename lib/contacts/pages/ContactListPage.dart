import 'package:cdonline/contacts/pages/NewContactPage.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/pacman_indicator.dart';

import 'package:cdonline/contacts/widgets/ContactList.dart';
import 'package:cdonline/contacts/Contact.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadWidget(context),
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) =>
        _buildPageOnSnapshot(context, snapshot),
    );
  }

  Future<List<Contact>> _loadWidget(BuildContext context) async {
    return await ContactTable.allContact();
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewContactPage()));
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
}
