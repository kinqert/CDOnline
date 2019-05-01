import 'package:flutter/material.dart';
import 'package:cdonline/operations/Credit.dart';
import 'package:cdonline/operations/CreditDelegate.dart';

class Contact implements CreditDelegate {
  String name;
  String lastName;
  String adress;
  String note;
  Image image;
  Credit credit;
  List<Credit> historyDebt = new List<Credit>();

  Contact({this.name, this.lastName, this.adress, this.note, this.image});

  Contact.getDefault() {
    name = "Nome";
    lastName = "Cognome";
    note = "Testo di prova per la descrizione";
  }

  bool debtExist() {
    return credit != null;
  }

  setCredit(Credit credit) {
    this.credit = credit;
    this.credit.delegate = this;
  }

  Credit getCredit() {
    return credit;
  }

  Image getImage() {
    if (image == null)
      return Image(image: AssetImage('images/defaultUser.png'),);
  }

  @override
  void creditExtinguished() {
    historyDebt.add(credit);
    credit = null;
  }
}