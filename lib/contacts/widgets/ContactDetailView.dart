import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/contacts/ContactData.dart';
import 'package:cdonline/contacts/widgets/ContactDetail.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:flutter/material.dart';

class ContactDetailView extends StatefulWidget {
  final Contact contact;
  const ContactDetailView(this.contact, {Key key}) : super(key: key);

  _ContactDetailViewState createState() => _ContactDetailViewState(contact);
}

class _ContactDetailViewState extends State<ContactDetailView>
    implements ContactDetailDelegate {
  Contact contact;

  _ContactDetailViewState(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ContactDetail(contact.data, this),
          ),
          RaisedButton(
            color: Theme.of(context).errorColor,
            onPressed: _deleteContact,
            child: Text('Delete Contact'),
          )
        ],
      ),
    );
  }

  @override
  void updateContactData(ContactData data) {
    setState(() {
      contact.data = data;
      ContactTable.instance.updateContact(data);
    });
  }

  void _deleteContact() {
    ContactTable.instance.deleteContact(contact.data);
    Navigator.pop(context);
  }
}
