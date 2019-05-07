import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Transaction.dart';

abstract class CDUtil {
  static String getNameOperation(Operation operation) {
    if (operation is Transaction)
      return "Transaction";
    else {
      if (operation.data.direction == OperationDirection.FromUserToContact) 
        return "Credit";
      return "Debt";
    }
  }
}