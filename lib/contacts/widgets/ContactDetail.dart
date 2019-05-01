import 'package:flutter/material.dart';

import '../ContactData.dart';

class ContactDetail extends StatelessWidget {
  final ContactData data;
  const ContactDetail(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Contact detail view"),);
  }
}