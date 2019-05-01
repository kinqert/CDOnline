import 'package:flutter/material.dart';

import '../ContactData.dart';

class ContactDetail extends StatefulWidget {
  final ContactData data;
  ContactDetail(this.data, {Key key}) : super(key: key);

  _ContactDetailState createState() => _ContactDetailState(data);
}

class _ContactDetailState extends State<ContactDetail> {
  ContactData data;

  _ContactDetailState(this.data);

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(children: <Widget>[
      Image.asset('images/defaultUser.png'),
      _buildTextField(context, "Name:", data.name),
      _buildTextField(context, "Lastname:", data.lastName),
      _buildTextField(context, "Phone number:", data.phone),
      _buildTextField(context, "Name:", data.address),
      _buildTextField(context, "Name:", data.note),
    ],));
  }

  Widget _buildTextField(BuildContext context, String description, String value) {
    return Row(children: <Widget>[
      Text(description),
      TextField(controller: TextEditingController(text: value),)
    ],);
  }
}