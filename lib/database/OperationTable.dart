import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/database/CreditTable.dart';
import 'package:cdonline/database/TransactionTable.dart';
import 'package:cdonline/operations/Operation.dart';

enum OrderType{
  id, amount, date, description
}

class OperationTable {
  static Future<List<Operation>> getAllOperations() async {
    List<Operation> operations = new List<Operation>();
    operations += await CreditTable.instance.allCredit();
    operations += await TransactionTable.instance.allTransactions();
    operations.sort((o1, o2) => o1.data.date.compareTo(o2.data.date));
    return operations;
  }

  static Future<List<Operation>> getAllOperationsFromContact(Contact contact) async {
    List<Operation> operations = await getAllOperations();
    operations.retainWhere((operation) => operation.data.contactId == contact.data.id);
    return operations;
  }
}