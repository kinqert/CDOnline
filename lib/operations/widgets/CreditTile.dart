import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/widgets/CreditText.dart';
import 'package:cdonline/util/CDIcons.dart';
import 'package:flutter/material.dart';

import '../Operation.dart';

class CreditTile extends StatelessWidget {
  final Credit credit;

  const CreditTile(this.credit, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          CDIcons.getIconForOperation(credit),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CreditText(credit),
                Text("Date: ${credit.data.date}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
