import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cdonline/models/Contact.dart';

class ContactDetail extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Image.asset(
              'images/defaultUser.png',
              width: 75,
              height: 75,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[_buildTextFormFields(context)],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormFields(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildNameTextFormField(context),
          _buildLastnameTextFormField(context),
          _buildPhoneTextFormField(context),
          _buildAddressTextFormField(context),
          _buildNoteTextFormField(context),
        ],
      ),
    );
  }

  Widget _buildNameTextFormField(BuildContext context) {
    return TextFormField(
        onSaved: (String name) {
          Contact contact = Provider.of<Contact>(context);
          contact.name = name;
        },
        decoration: InputDecoration(hintText: "Enter Name"),
        validator: (value) {
          if (value.isEmpty) return 'Please add name';
        });
  }

  Widget _buildLastnameTextFormField(BuildContext context) {
    return TextFormField(
        onSaved: (String lastname) {
          Contact contact = Provider.of<Contact>(context);
          contact.lastName = lastname;
        },
        decoration: InputDecoration(hintText: "Enter Lastname"));
  }

  Widget _buildPhoneTextFormField(BuildContext context) {
    return TextFormField(
        onSaved: (String phone) {
          Contact contact = Provider.of<Contact>(context);
          contact.phone = phone;
        },
        decoration: InputDecoration(hintText: "Enter Phone"));
  }

  Widget _buildAddressTextFormField(BuildContext context) {
    return TextFormField(
        onSaved: (String address) {
          Contact contact = Provider.of<Contact>(context);
          contact.address = address;
        },
        decoration: InputDecoration(hintText: "Enter Address"));
  }

  Widget _buildNoteTextFormField(BuildContext context) {
    return TextFormField(
        onSaved: (String note) {
          Contact contact = Provider.of<Contact>(context);
          contact.note = note;
        },
        decoration: InputDecoration(hintText: "Enter Note"));
  }
}
