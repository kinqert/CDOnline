import 'package:flutter/material.dart';

import '../ContactData.dart';

abstract class ContactDetailDelegate {
  void updateContactData(ContactData data);
}

class ContactDetail extends StatefulWidget {
  final ContactData data;
  final ContactDetailDelegate delegate;
  const ContactDetail(this.data, this.delegate, {Key key}) : super(key: key);

  _ContactDetailState createState() => _ContactDetailState(data);
}

class _ContactDetailState extends State<ContactDetail> {
  TextEditingController nameController;
  TextEditingController lastnameController;
  TextEditingController phoneController;
  TextEditingController addressController;
  TextEditingController noteController;

  final _formKey = GlobalKey<FormState>();

  ContactData data;

  _ContactDetailState(this.data) {
    _setUpTextEditingFromData();
  }

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
            _buildForm()
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
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
          _buildFormField(nameController, true),
          _buildFormField(lastnameController, false),
          _buildFormField(phoneController, false),
          _buildFormField(addressController, false),
          _buildFormField(noteController, false),
        ],
      ),
    );
  }

  Widget _buildFormField(TextEditingController controller, bool notNull) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value.isEmpty) return 'Please add name';
      },
      onEditingComplete: updateIfValidate,
    );
  }

  void _setUpTextEditingFromData() {
    nameController = TextEditingController(text: data.name);
    lastnameController = TextEditingController(text: data.lastName);
    phoneController = TextEditingController(text: data.phone);
    addressController = TextEditingController(text: data.address);
    noteController = TextEditingController(text: data.note);
  }

  void updateIfValidate() {
    if (_formKey.currentState.validate())
      setState(() {
        _setContactDataFromText();
        widget.delegate.updateContactData(data);
      });
  }

  bool isValidate() {
    return _formKey.currentState.validate();
  }

  void _setContactDataFromText() {
    data.name = nameController.text;
    data.lastName = lastnameController.text;
    data.phone = phoneController.text;
    data.address = addressController.text;
    data.note = noteController.text;
  }
}
