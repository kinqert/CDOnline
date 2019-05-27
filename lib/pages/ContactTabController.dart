import 'package:flutter/material.dart';

import 'package:cdonline/models/Contact.dart';
import 'package:cdonline/widgets/contacts/ContactDetailView.dart';
import 'package:cdonline/widgets/contacts/ContactOperationsList.dart';

class ContactTabController extends StatelessWidget {
  final Contact contact;
  const ContactTabController(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(contact.name),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.face)),
                Tab(
                  icon: Icon(Icons.list),
                )
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            ContactDetailView(contact),
            ContactOperationsList(contact)
          ],),
        ),
      ),
    );
  }
}
