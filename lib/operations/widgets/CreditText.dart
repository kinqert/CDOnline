import 'package:flutter/material.dart';

import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';

class CreditText extends StatelessWidget {
  final Credit credit;
  const CreditText(this.credit, {Key key}) : super(key: key);

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
      Widget amountLeftText = Text("${credit.amount}€", style: new TextStyle(color: amountColor),);

      return Row(children: <Widget>[descriptionText, amountLeftText],);
    }
  }
}