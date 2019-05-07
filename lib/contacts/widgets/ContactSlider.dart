import 'package:cdonline/contacts/widgets/ContactMini.dart';
import 'package:flutter/material.dart';

import '../Contact.dart';

abstract class ContactSliderDelegate {
  void contactsUpdated();
}
class ContactSlider extends StatefulWidget {
  final List<Contact> contacts;
  final List<Contact> selectedContacts;
  final ContactSliderDelegate delegate;

  const ContactSlider(this.contacts, this.selectedContacts, this.delegate, {Key key}) : super(key: key);

  _ContactSliderState createState() => _ContactSliderState(contacts, selectedContacts, delegate);
}

class _ContactSliderState extends State<ContactSlider> {
  List<Contact> contacts;
  List<Contact> selectedContacts = List<Contact>();
  ContactSliderDelegate delegate;


  _ContactSliderState(this.contacts, this.selectedContacts, this.delegate);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: _buildContactMiniDecorated(context, index),
              ),
              onTap: () {
                contactTap(index);
              },
            );
          }),
    );
  }

  void contactTap(int index) {
    setState(() {
      if (!selectedContacts.remove(contacts[index])) {
        selectedContacts.add(contacts[index]);
      }
      delegate.contactsUpdated();
    });
  }

  Widget _buildContactMiniDecorated(BuildContext context, int index) {
    Color color = selectedContacts.contains(contacts[index]) ? Theme.of(context).accentColor : Theme.of(context).primaryColor;
    Decoration decoration = BoxDecoration(
          border: Border.all(color: color, width: 3),
          borderRadius: BorderRadius.circular(20));

    return Container(
        padding: EdgeInsets.all(10),
        decoration: decoration,
        child: ContactMini(contacts[index].data));
  }
}
