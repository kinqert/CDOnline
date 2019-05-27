import 'package:flutter/material.dart';

import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/models/Credit.dart';

class CDColors {
  static Color red = Color(0xffff3131);
  static Color green = Color(0xff5fff89);

  static Color getOperationColor(Operation operation) {
    var fromUToC = operation.direction == OperationDirection.FromUserToContact;

    if(operation is Credit) {
      return fromUToC ? green : red;
    }
    
    return fromUToC ? red : green;
  }

  static Color getActiveColorOperation(Operation operation) {
    return operation is Credit ? red : green;
  }

  static Color getInactiveColorOperation(Operation operation) {
    return operation is Credit ? green : red;
  }

  static Color getInactiveTrackColorOperation(Operation operation) {
    return operation is Credit ? Colors.green[800] : Colors.red[800];
  }
}