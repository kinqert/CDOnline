import 'package:cdonline/models/Contact.dart';
import 'package:cdonline/database/OperationTable.dart';
import 'package:cdonline/widgets/operations/OperationList.dart';
import 'package:flutter/material.dart';

class ContactOperationsList extends StatelessWidget {
  final Contact contact;
  const ContactOperationsList(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: OperationTable.getAllOperationsFromContact(contact),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return OperationList(snapshot.data);
        }
        return Text('Nessuna operazione');
    },);
  }
}