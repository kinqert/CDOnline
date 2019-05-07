import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/database/CreditTable.dart';
import 'package:cdonline/database/TransactionTable.dart';
import 'package:cdonline/operations/Operation.dart';

class OperationTable {
  static Future<List<Operation>> getAllOperations() async {
    List<Operation> operations = new List<Operation>();
    operations += await CreditTable.instance.allCredit();
    operations += await TransactionTable.instance.allTransactions();
    return operations;
  }

  static Future<List<Operation>> getAllOperationsFromContact(Contact contact) async {
    List<Operation> operations = await getAllOperations();
    operations.retainWhere((operation) => operation.data.contactId == contact.data.id);
    return operations;
  }
}