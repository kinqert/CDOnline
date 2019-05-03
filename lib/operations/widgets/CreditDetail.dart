import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/database/ContactTable.dart';
import 'package:flutter/material.dart';

import '../Credit.dart';

class CreditDetail extends StatelessWidget {
  final Credit credit;

  const CreditDetail(this.credit, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContactTable.instance.allContact(),
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        return Card(
            child: Column(
              children: <Widget>[
                Text("New Credit")
              ],
            ),
        );
      },
    );
  }
}
