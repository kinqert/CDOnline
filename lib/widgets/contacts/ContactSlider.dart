import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cdonline/models/Contact.dart';
import 'package:cdonline/scoped_models/SelectedContactListNotifier.dart';

import 'ContactMini.dart';

class ContactSlider extends StatelessWidget {
  final List<Contact> contacts;

  const ContactSlider(this.contacts);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedContactModel>(
      builder: (context, listNotifier, _) => Container(
            color: Theme.of(context).primaryColor,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: _buildContactMiniDecorated(
                          context, listNotifier, index),
                    ),
                    onTap: () {
                      contactTap(listNotifier, index);
                    },
                  );
                }),
          ),
    );
  }

  void contactTap(SelectedContactModel contactList, int index) {
    if (!contactList.removeContact(contacts[index])) {
      contactList.addContact(contacts[index]);
    }
  }

  Widget _buildContactMiniDecorated(BuildContext context,
      SelectedContactModel contactList, int index) {
    Color color = contactList.selectedContacts.contains(contacts[index])
        ? Theme.of(context).accentColor
        : Theme.of(context).primaryColor;
    Decoration decoration = BoxDecoration(
        border: Border.all(color: color, width: 3),
        borderRadius: BorderRadius.circular(20));

    return Provider<Contact>(
        builder: (BuildContext context) => contacts[index],
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: decoration,
            child: ContactMini()));
  }
}
