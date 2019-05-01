import 'package:flutter/material.dart';

import '../Contact.dart';

class ContactDetailPage extends StatelessWidget {
  final Contact contact;
  const ContactDetailPage(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: Center(child: Text("new page operation"),),);
  }
}