import 'package:flutter/material.dart';

import 'package:cdonline/models/Credit.dart';
import 'package:cdonline/models/Operation.dart';

class CreditLeft extends StatelessWidget {
  final Credit credit;

  const CreditLeft(this.credit, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (credit == null)
      return Text("Nessun credito/debito attivo");
    else {
      String description = credit.direction == OperationDirection.FromUserToContact 
        ? "Credit: " : "Debt: ";
      Widget descriptionText = Text(description);

      Color amountColor = credit.direction == OperationDirection.FromUserToContact 
        ? Theme.of(context).hintColor : Theme.of(context).errorColor;
      Widget amountLeftText = Text("${credit.getAmountLeft()}€", style: new TextStyle(color: amountColor),);

      return Row(children: <Widget>[descriptionText, amountLeftText],);
    }
  }
}