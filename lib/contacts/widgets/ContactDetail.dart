import 'package:flutter/material.dart';

import '../ContactData.dart';

class ContactDetail extends StatefulWidget {
  final ContactData data;
  ContactDetail(this.data, {Key key}) : super(key: key);

  _ContactDetailState createState() => _ContactDetailState(data);
}

class _ContactDetailState extends State<ContactDetail> {
  TextEditingController nameController;
  TextEditingController lastnameController;
  TextEditingController phoneController;
  TextEditingController addressController;
  TextEditingController noteController;

  ContactData data;

  _ContactDetailState(this.data) {
    _setUpTextEditingFromData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView(
        children: <Widget>[
          Image.asset(
            'images/defaultUser.png',
            width: 75,
            height: 75,
          ),
          _buildForm()
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_buildTextField()],
      ),
    );
  }

  Widget _buildTextField() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextFormField(controller: nameController),
          TextFormField(controller: lastnameController),
          TextFormField(controller: phoneController),
          TextFormField(controller: addressController),
          TextFormField(controller: noteController),
        ],
      ),
    );
  }

  void _setUpTextEditingFromData() {
    nameController = TextEditingController(text: data.name);
    lastnameController = TextEditingController(text: data.lastName);
    phoneController = TextEditingController(text: data.phone);
    addressController = TextEditingController(text: data.address);
    noteController = TextEditingController(text: data.note);
  }
}
