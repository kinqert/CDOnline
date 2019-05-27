import 'package:cdonline/models/Credit.dart';
import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/models/Transaction.dart';

abstract class CDUtil {
  static String getNameOperation(Operation operation) {
    if (operation is Transaction)
      return "Transaction";
    else {
      if (operation.direction == OperationDirection.FromUserToContact) 
        return "Credit";
      return "Debt";
    }
  }

  static String getDirectionNameForOperation(Operation operation, OperationDirection direction) {
    if (operation is Credit) {
      return direction == OperationDirection.FromUserToContact ?
        "Credit" : "Debit";
    } else if (operation is Transaction) {
      return direction == OperationDirection.FromUserToContact ?
        "Given" : "Recived";
    }

    return null;
  }
}