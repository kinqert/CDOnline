import 'package:flutter/material.dart';
import 'package:cdonline/contacts/Contact.dart';

class ContactTableCell extends StatelessWidget {
  final Contact contact;
  const ContactTableCell(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Row(children: _buildRowElements()));
  }

  List<Widget> _buildRowElements() {
    List<Widget> rowElements = new List<Widget>();

    rowElements.add(_buildContentRow());

    return rowElements;
  }

  Widget _buildContentRow() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(children: <Widget>[
        Text("${contact.name} ${contact.lastName}",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text("Dell altro testo")
      ]),
    );
  }
}
