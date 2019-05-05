import 'package:flutter/material.dart';
import 'package:cdonline/contacts/Contact.dart';
import 'ContactTableCell.dart';
import '../pages/ContactTabController.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  const ContactList(this.contacts, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: contacts.length, itemBuilder: (context, index) {
      ContactTableCell cell = ContactTableCell(contacts[index]);
      Container container = Container(child: cell, padding: EdgeInsets.only(top: 20, left: 10, bottom: 0, right: 10),);
      return GestureDetector(child: container, onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ContactTabController(contacts[index])));
      },);
    },);
  }
}