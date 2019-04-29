import 'package:flutter/material.dart';
import 'package:cdonline/contacts/Contact.dart';
import 'ContactTableCell.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  const ContactList(this.contacts, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildColumsElement());
  }

  List<Widget> _buildColumsElement() {
    List<Widget> rows = new List<Widget>();

    for (var contact in contacts) {
      rows.add(ContactTableCell(contact));
    }

    return rows;
  }
}