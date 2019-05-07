import 'package:cdonline/contacts/ContactData.dart';
import 'package:cdonline/operations/Credit.dart';

class Contact implements CreditDelegate {
  ContactData data;

  Credit credit;
  List<Credit> historyDebt = new List<Credit>();

  Contact(this.data);

  bool creditExist() {
    return credit != null;
  }

  setCredit(Credit credit) {
    this.credit = credit;
    this.credit.delegate = this;
  }

  Credit getCredit() {
    return credit;
  }

  @override
  void creditExtinguished() {
    historyDebt.add(credit);
    credit = null;
  }
}