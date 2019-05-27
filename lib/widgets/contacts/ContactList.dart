import 'package:flutter/material.dart';

import 'package:cdonline/pages/ContactTabController.dart';
import 'package:cdonline/models/Contact.dart';
import 'package:provider/provider.dart';
import 'ContactTableCell.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = Provider.of<List<Contact>>(context);

    return ListView.builder(itemCount: contacts.length, itemBuilder: (context, index) {
      ContactTableCell cell = ContactTableCell(contacts[index]);
      Container container = Container(child: cell, padding: EdgeInsets.only(top: 10, left: 5, bottom: 0, right: 5),);
      return GestureDetector(child: container, onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ContactTabController(contacts[index])));
      },);
    },);
  }
}