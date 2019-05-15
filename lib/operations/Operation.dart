import 'package:flutter/material.dart';

enum OperationDirection { FromUserToContact, FromContactToUser }

class OperationData with ChangeNotifier {
  int _id;
  int _contactId;
  double _amount;
  DateTime _date;
  String _description;
  OperationDirection _direction;

  int get id => _id;
  int get contactId => _contactId;
  double get amount => _amount;
  DateTime get date => _date;
  String get description => _description;
  OperationDirection get direction => _direction;

  set id(int value) {
    _id = value;
    notifyListeners();
  }

  set contactId(int value) {
    _contactId = value;
    notifyListeners();
  }

  set amount(double value) {
    _amount = value;
    notifyListeners();
  }

  set date(DateTime value) {
    _date = value;
    notifyListeners();
  }

  set description(String value) {
    _description = value;
    notifyListeners();
  }

  set direction(OperationDirection value) {
    _direction = value;
    notifyListeners();
  }

  OperationData({
    int id,
    int contactId,
    double amount,
    DateTime date,
    String description,
    OperationDirection direction,
  }) {
    this._id = id;
    this._contactId = contactId;
    this._amount = amount;
    this._date = date;
    this._description = description;
    this._direction = direction;
  }

  OperationData.newAmount() {
    amount = 0.0;
    direction = OperationDirection.FromUserToContact;
    description = '';
  }
}

abstract class Operation {
  final OperationData data;

  const Operation(this.data);
}
