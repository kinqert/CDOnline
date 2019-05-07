import 'package:cdonline/contacts/Contact.dart';
import 'package:cdonline/contacts/ContactData.dart';
import 'package:cdonline/database/CreditTable.dart';
import 'package:cdonline/database/Table.dart';
import 'package:cdonline/database/TransactionTable.dart';

class ContactTable extends Table<ContactData> {
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

  Map<String, dynamic> _createRowFromData(ContactData data) {
    return {
      columnId: data.id,
      columnName: data.name,
      columnLastname: data.lastName,
      columnPhone: data.phone,
      columnAddress: data.address,
      columnNote: data.note,
    };
  }

  ContactData _createDataFromRow(Map<String, dynamic> row) {
    return ContactData(
        id: row[columnId],
        name: row[columnName],
        lastName: row[columnLastname],
        phone: row[columnPhone],
        address: row[columnAddress],
        note: row[columnNote]);
  }

  void insertContact(ContactData data) async {
    insert(data, _createRowFromData);
  }

  Future<List<ContactData>> allContactData() async {
    return allData(_createDataFromRow);
  }

  Future<List<Contact>> allContact() async {
    List<Contact> contacts = new List<Contact>();

    for (ContactData data in await allContactData()) {
      var contact = Contact(data);
      contact.credit = await CreditTable.instance.getContactCredit(contact);
      contacts.add(contact);
    }

    return contacts;
  }

  void updateContact(ContactData data) async {
    updateData(data, _createRowFromData);
  }

  void deleteContact(Contact contact) async {
    TransactionTable.instance.deleteAllTransactionFromContact(contact);
    CreditTable.instance.deleteAllCreditFromContact(contact);
    deleteData(contact.data.id);
  }
}
