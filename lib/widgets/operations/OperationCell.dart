import 'package:flutter/material.dart';

import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/util/CDColors.dart';
import 'package:cdonline/util/CDIcons.dart';
import 'package:cdonline/util/CDUtil.dart';

class OperationCell extends StatelessWidget {
  final Operation operation;

  const OperationCell
(this.operation, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          CDIcons.getIconForOperation(operation),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${CDUtil.getNameOperation(operation)}: ${operation.amount}",
                  style:
                      TextStyle(color: CDColors.getOperationColor(operation)),
                ),
                Text("Date: ${operation.date}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
