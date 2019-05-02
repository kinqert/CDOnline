import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/contacts/ContactData.dart';
import 'package:cdonline/contacts/widgets/ContactDetail.dart';
import 'package:cdonline/contacts/widgets/ContactOperationsList.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:flutter/material.dart';

class ContactTabController extends StatelessWidget implements ContactDetailDelegate {
  final Contact contact;
  const ContactTabController(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(contact.data.name),
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
            ContactDetail(contact.data, this),
            ContactOperationsList()
          ],),
        ),
      ),
    );
  }

  @override
  void updateContactData(ContactData data) {
    contact.data = data;
    ContactTable.update(data);
  }
}
