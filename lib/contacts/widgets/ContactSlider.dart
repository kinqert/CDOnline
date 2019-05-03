import 'package:cdonline/contacts/ContactData.dart';
import 'package:cdonline/contacts/widgets/ContactMini.dart';
import 'package:flutter/material.dart';

class ContactSlider extends StatefulWidget {
  final List<ContactData> contacts;

  const ContactSlider(this.contacts, {Key key}) : super(key: key);

  _ContactSliderState createState() => _ContactSliderState(this.contacts);
}

class _ContactSliderState extends State<ContactSlider> {
  List<ContactData> contacts;
  List<int> selectedContacts = List<int>();

  _ContactSliderState(this.contacts);

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
      if (!selectedContacts.remove(index)) {
        selectedContacts.add(index);
      }
    });
  }

  Widget _buildContactMiniDecorated(BuildContext context, int index) {
    Color color = selectedContacts.contains(index) ? Theme.of(context).accentColor : Theme.of(context).primaryColor;
    Decoration decoration = BoxDecoration(
          border: Border.all(color: color, width: 3),
          borderRadius: BorderRadius.circular(20));

    return Container(
        padding: EdgeInsets.all(10),
        decoration: decoration,
        child: ContactMini(contacts[index]));
  }
}
