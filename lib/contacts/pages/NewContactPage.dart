import 'package:cdonline/contacts/ContactData.dart';
import 'package:cdonline/contacts/widgets/ContactDetail.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  NewContactPage({Key key}) : super(key: key);

  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage>
    implements ContactDetailDelegate {
  ContactData data = ContactData.getDefalut();

  @override
  Widget build(BuildContext context) {
    ContactData data = ContactData.getDefalut();
    ContactDetail detail = ContactDetail(data, this);

    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              ContactTable.instance.insertContact(data);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: detail,
    );
  }

  @override
  void updateContactData(ContactData data) {
    setState(() {
      this.data = data;
    });
  }
}
