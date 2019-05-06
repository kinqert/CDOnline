import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:flutter/material.dart';

class CDColors {
  static Color red = Color(0xffff3131);
  static Color green = Color(0xff5fff89);

  static Color getDirectionColor(OperationData data) {
    return data.direction == OperationDirection.FromUserToContact ? green : red;
  }
}