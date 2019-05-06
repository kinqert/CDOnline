import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:flutter/material.dart';

class CDColors {
  static Color red = Color(0xffff3131);
  static Color green = Color(0xff5fff89);

  static Color getOperationColor(Operation operation) {
    var fromUToC = operation.data.direction == OperationDirection.FromUserToContact;

    if(operation is Credit) {
      return fromUToC ? green : red;
    }
    
    return fromUToC ? red : green;
  }
}