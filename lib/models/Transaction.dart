import 'Operation.dart';

class Transaction extends Operation {
  int _creditId;

  int get creditId => _creditId;

  set creditId(int value) {
    _creditId = value;
    notifyListeners();
  }

  Transaction();
  
  Transaction.newTransaction() : super.newAmount();
}
