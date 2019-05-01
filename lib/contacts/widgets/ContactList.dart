import 'package:flutter/material.dart';
import 'package:cdonline/contacts/Contact.dart';
import 'ContactTableCell.dart';
import '../pages/ContactTabController.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  const ContactList(this.contacts, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: _buildColumsElement(context));
  }

  List<Widget> _buildColumsElement(BuildContext context) {
    List<Widget> rows = new List<Widget>();

    for (var contact in contacts) {
      ContactTableCell cell = ContactTableCell(contact);
      rows.add(GestureDetector(child: cell, onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ContactTabController(contact)));
      },));
    }

    return rows;
  }
}