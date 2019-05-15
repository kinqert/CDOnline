import 'package:flutter/widgets.dart';

import '../Contact.dart';

class SelectedContactListNotifier with ChangeNotifier {
  List<Contact> selectedContacts = new List<Contact>();

  void addContact(Contact contact) {
    selectedContacts.add(contact);
    notifyListeners();
  }

  bool removeContact(Contact contact) {
    bool ris = selectedContacts.remove(contact);
    notifyListeners();
    return ris;
  }
}