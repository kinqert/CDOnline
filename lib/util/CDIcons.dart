import 'package:flutter/material.dart';

import 'package:cdonline/models/Credit.dart';
import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/models/Transaction.dart';
import 'package:cdonline/util/CDColors.dart';

abstract class CDIcons {
  static Widget getIconForOperation(Operation operation) {
    if (operation is Credit) {
      var isCredit = operation.direction == OperationDirection.FromUserToContact;
      Color iconColor = isCredit ? CDColors.green : CDColors.red;
      IconData icon = isCredit ? Icons.trending_up : Icons.trending_down;
      return Icon(icon, color: iconColor, size: 50,);
    } else if (operation is Transaction) {
      var isRecived = operation.direction == OperationDirection.FromContactToUser;
      Color iconColor = isRecived ? CDColors.green : CDColors.red;
      return Icon(Icons.attach_money, color: iconColor, size: 50,);
    }
    return null;
  }
}