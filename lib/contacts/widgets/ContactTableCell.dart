import 'package:flutter/material.dart';
import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/operations/widgets/CreditText.dart';

class ContactTableCell extends StatelessWidget {
  final Contact contact;

  const ContactTableCell(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 20),
        child: Row(children: _buildRowElements(context)));
  }

  List<Widget> _buildRowElements(BuildContext context) {
    List<Widget> rowElements = new List<Widget>();

    rowElements.add(_buildImageRow());
    rowElements.add(_buildContentRow(context));

    return rowElements;
  }

  Widget _buildImageRow() {
    return Container(
      width: 50,
      height: 50,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image:
              new DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/defaultUser.png'))),
    );
  }

  Widget _buildContentRow(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${contact.data.name} ${contact.data.lastName}",
              style: TextStyle(fontWeight: FontWeight.bold)),
          CreditText(contact.credit),
        ]);
  }
}
