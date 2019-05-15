import 'package:cdonline/contacts/widgets/ContactMini.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Contact.dart';
import 'SelectedContactListNotifier.dart';

class ContactSlider extends StatelessWidget {
  final List<Contact> contacts;

  const ContactSlider(this.contacts);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedContactListNotifier>(
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

  void contactTap(SelectedContactListNotifier contactListNotifier, int index) {
    if (!contactListNotifier.removeContact(contacts[index])) {
      contactListNotifier.addContact(contacts[index]);
    }
  }

  Widget _buildContactMiniDecorated(BuildContext context,
      SelectedContactListNotifier contactListNotifier, int index) {
    Color color = contactListNotifier.selectedContacts.contains(contacts[index])
        ? Theme.of(context).accentColor
        : Theme.of(context).primaryColor;
    Decoration decoration = BoxDecoration(
        border: Border.all(color: color, width: 3),
        borderRadius: BorderRadius.circular(20));

    return Container(
        padding: EdgeInsets.all(10),
        decoration: decoration,
        child: ContactMini(contacts[index].data));
  }
}
