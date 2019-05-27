import 'Credit.dart';

class Contact implements CreditDelegate {
  int id;
  String name;
  String lastName;
  String phone;
  String address;
  String note;

  Credit credit;
  List<Credit> historyDebt = new List<Credit>();

  Contact(
      {this.id, this.name, this.lastName, this.phone, this.address, this.note});

  bool creditExist() {
    return credit != null;
  }

  Contact.getDefalut() {
    name = "";
    lastName = "";
    phone = "";
    address = "";
    note = "";
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
