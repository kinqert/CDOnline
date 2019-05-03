import 'package:flutter/material.dart';

enum OperationDirection {
  FromUserToContact, FromContactToUser
}

class OperationData {
  int id;
  int contactId;
  double amount;
  DateTime date;
  String description;
  OperationDirection direction;

  OperationData({this.id, this.contactId, this.amount, this.date, this.direction, this.description});
}

abstract class Operation {
  final OperationData data;

  const Operation(this.data);
}