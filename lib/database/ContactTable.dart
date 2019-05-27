import 'package:cdonline/database/CreditTable.dart';
import 'package:cdonline/database/Table.dart';
import 'package:cdonline/database/TransactionTable.dart';

import 'package:cdonline/models/Contact.dart';

class ContactTable extends Table<Contact> {
  static final table = 'Contacts';
  static final id = 'id';
  static final columnName = 'name';
  static final columnLastname = 'lastname';
  static final columnPhone = 'phone';
  static final columnAddress = 'address';
  static final columnNote = 'note';

  static final ContactTable instance = ContactTable();

  ContactTable() : super(table, id);

  static String getCreateString() {
    return '''
          CREATE TABLE $table (
            $id INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnLastname TEXT,
            $columnPhone TEXT,
            $columnAddress TEXT,
            $columnNote TEXT
          )
          ''';
  }

  Map<String, dynamic> _createRowFromData(Contact contact) {
    return {
      columnId: contact.id,
      columnName: contact.name,
      columnLastname: contact.lastName,
      columnPhone: contact.phone,
      columnAddress: contact.address,
      columnNote: contact.note,
    };
  }

  Contact _createDataFromRow(Map<String, dynamic> row) {
    return Contact(
        id: row[columnId],
        name: row[columnName],
        lastName: row[columnLastname],
        phone: row[columnPhone],
        address: row[columnAddress],
        note: row[columnNote]);
  }

  void insertContact(Contact contact) async {
    insert(contact, _createRowFromData);
  }

  Future<List<Contact>> allContact() async {
    List<Contact> contacts = new List<Contact>();

    for (Contact contact in await allData(_createDataFromRow)) {
      contact.credit = await CreditTable.instance.getContactCredit(contact);
      contacts.add(contact);
    }

    return contacts;
  }

  void updateContact(Contact contact) async {
    updateData(contact, _createRowFromData);
  }

  void deleteContact(Contact contact) async {
    TransactionTable.instance.deleteAllTransactionFromContact(contact);
    CreditTable.instance.deleteAllCreditFromContact(contact);
    deleteData(contact.id);
  }
}
