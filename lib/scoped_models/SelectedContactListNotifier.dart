import 'package:flutter/widgets.dart';

import 'package:cdonline/models/Contact.dart';

class SelectedContactModel with ChangeNotifier {
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