import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Transaction.dart';

abstract class CDUtil {
  static String getNameOperationData(OperationData data) {
    if (data is TransactionData)
      return "Transaction";
    else {
      if (data.direction == OperationDirection.FromUserToContact) 
        return "Credit";
      return "Debt";
    }
  }

  static String getDirectionNameForOperationData(OperationData data, OperationDirection direction) {
    if (data is OperationData) {
      return direction == OperationDirection.FromUserToContact ?
        "Credit" : "Debit";
    } else if (data is TransactionData) {
      return direction == OperationDirection.FromUserToContact ?
        "Given" : "Recived";
    }

    return null;
  }
}