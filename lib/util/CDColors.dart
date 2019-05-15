import 'package:cdonline/operations/Operation.dart';
import 'package:flutter/material.dart';

class CDColors {
  static Color red = Color(0xffff3131);
  static Color green = Color(0xff5fff89);

  static Color getOperationDataColor(OperationData data) {
    var fromUToC = data.direction == OperationDirection.FromUserToContact;

    if(data is OperationData) {
      return fromUToC ? green : red;
    }
    
    return fromUToC ? red : green;
  }

  static Color getActiveColorOperationData(OperationData data) {
    return data is OperationData ? red : green;
  }

  static Color getInactiveColorOperationData(OperationData data) {
    return data is OperationData ? green : red;
  }

  static Color getInactiveTrackColorOperationData(OperationData data) {
    return data is OperationData ? Colors.green[800] : Colors.red[800];
  }
}