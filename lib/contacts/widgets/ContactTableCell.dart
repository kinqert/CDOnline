import 'package:flutter/material.dart';
import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/operations/widgets/CreditText.dart';

class ContactTableCell extends StatelessWidget {
  final Contact contact;

  const ContactTableCell(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: _buildColumnElements(context));
  }

  Widget _buildColumnElements(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, bottom: 20, right: 20),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildImageColumn(),
        Expanded(child: _buildContentColumn(context))
      ]),
    );
  }

  Widget _buildImageColumn() {
    return Container(
      width: 50,
      height: 50,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              fit: BoxFit.fill, image: AssetImage('images/defaultUser.png'))),
    );
  }

  Widget _buildContentColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("${contact.data.name} ${contact.data.lastName}",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: CreditText(contact.credit),
            ),
          ]),
    );
  }
}
