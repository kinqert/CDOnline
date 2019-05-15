import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/contacts/ContactData.dart';
import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/Operation.dart';
import 'package:cdonline/operations/Transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ContactData initialData = ContactData(
    address: "address",
    name: "name",
    lastName: "lastname",
  );

  Contact contact;
  Credit credit;
  Transaction transaction;

  setUp(() {
    contact = new Contact(initialData);
    credit = new Credit(OperationData(
        description: "Description",
        amount: 15.0,
        direction: OperationDirection.FromUserToContact));
    transaction = new Transaction(TransactionData(
        amount: 15.0,
        direction: OperationDirection.FromContactToUser,
        description: "Description"));
  });

  test("init", () {
    expect(contact.data, initialData);
    expect(contact.creditExist(), false);
  });

  test("Set credit", () {
    contact.setCredit(credit);

    expect(contact.creditExist(), true);
  });

  test("Credit extinguished", () {
    contact.setCredit(credit);
    contact.credit.addTransaction(transaction);

    expect(contact.creditExist(), false);
  });
}
