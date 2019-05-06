import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/database/CreditTable.dart';
import 'package:cdonline/operations/widgets/OperationList.dart';
import 'package:flutter/material.dart';

class ContactOperationsList extends StatelessWidget {
  final Contact contact;
  const ContactOperationsList(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CreditTable.instance.getAllContactCredit(contact),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return OperationList(snapshot.data);
        }
        return Text('Nessuna operazione');
    },);
  }
}