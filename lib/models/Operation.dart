import 'package:flutter/material.dart';

enum OperationDirection { FromUserToContact, FromContactToUser }

abstract class Operation extends ChangeNotifier {
  int id;
  int contactId;
  double amount;
  DateTime date;
  String description;
  OperationDirection direction;

  Operation({
    this.id,
    this.contactId,
    this.amount,
    this.date,
    this.description,
    this.direction,
  });

  Operation.newAmount() {
    amount = 0.0;
    direction = OperationDirection.FromUserToContact;
    description = '';
  }
}
