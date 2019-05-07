import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Transaction.dart';
import 'package:cdonline/util/CDColors.dart';
import 'package:flutter/material.dart';

abstract class CDIcons {
  static Widget getIconForOperation(Operation operation) {
    if (operation is Credit) {
      var isCredit = operation.data.direction == OperationDirection.FromUserToContact;
      Color iconColor = isCredit ? CDColors.green : CDColors.red;
      IconData icon = isCredit ? Icons.trending_up : Icons.trending_down;
      return Icon(icon, color: iconColor, size: 50,);
    } else if (operation is Transaction) {
      var isRecived = operation.data.direction == OperationDirection.FromContactToUser;
      Color iconColor = isRecived ? CDColors.green : CDColors.red;
      return Icon(Icons.attach_money, color: iconColor, size: 50,);
    }
    return null;
  }
}