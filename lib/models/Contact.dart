import 'package:flutter/cupertino.dart';

import 'Credit.dart';

class Contact with ChangeNotifier implements CreditDelegate {
  int _id;
  String _name;
  String _lastName;
  String _phone;
  String _address;
  String _note;

  int get id => _id;
  String get name => _name;
  String get lastName => _lastName;
  String get phone => _phone;
  String get address => _address;
  String get note => _note;

  set id(int value) {
    _id = value;
    notifyListeners();
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set lastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  set phone(String value) {
    _phone = value;
    notifyListeners();
  }

  set address(String value) {
    _address = value;
    notifyListeners();
  }

  set note(String value) {
    _note = value;
    notifyListeners();
  }

  Credit _credit;

  Credit get credit => _credit;
  set credit(Credit value) {
    if (!value.isDebtPayed()) {
      _credit = value;
      _credit.delegate = this;
      notifyListeners();
    }
  }

  List<Credit> historyDebt = new List<Credit>();

  Contact();

  Contact.getDefalut() {
    name = "";
    lastName = "";
    phone = "";
    address = "";
    note = "";
  }

  bool creditExist() {
    return credit != null;
  }

  @override
  void creditExtinguished() {
    historyDebt.add(credit);
    _credit = null;
    notifyListeners();
  }
}
