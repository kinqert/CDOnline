import 'package:cdonline/models/Contact.dart';
import 'package:cdonline/models/Credit.dart';
import 'package:cdonline/models/Operation.dart';
import 'package:cdonline/models/Transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String initialAddress = "address";
  String initialName = "name";
  String initialLastName = "lastname";

  Contact contact;
  Credit credit;
  Transaction transaction;

  setUp(() {
    contact = new Contact();
    contact.address = initialAddress;
    contact.name = initialName;
    contact.lastName = initialLastName;

    credit = new Credit();
    credit.description = "Description";
    credit.amount = 15.0;
    credit.direction = OperationDirection.FromUserToContact;

    transaction = new Transaction();
    transaction.amount = 15.0;
    transaction.direction = OperationDirection.FromContactToUser;
    transaction.description = "Description";
  });

  test("init", () {
    expect(contact.address, initialAddress);
    expect(contact.name, initialName);
    expect(contact.lastName, initialLastName);
    expect(contact.creditExist(), false);
  });

  test("Set credit", () {
    contact.credit = credit;

    expect(contact.creditExist(), true);
  });

  test("Credit extinguished", () {
    contact.credit = credit;
    contact.credit.addTransaction(transaction);

    expect(contact.creditExist(), false);
  });
}
