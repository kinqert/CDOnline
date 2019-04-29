import 'package:flutter/material.dart';
import 'package:cdonline/operations/Debt.dart';
import 'package:cdonline/operations/DebtDelegate.dart';

class Contact implements DebtDelegate {
  String name;
  String lastName;
  String adress;
  String note;
  Image image;
  Debt debt;
  List<Debt> historyDebt = new List<Debt>();

  Contact({this.name, this.lastName, this.adress, this.note, this.image});

  Contact.getDefault() {
    name = "Nome";
    lastName = "Cognome";
    note = "Testo di prova per la descrizione";
  }

  bool debtExist() {
    return debt != null;
  }

  setDebt(Debt debt) {
    this.debt = debt;
    this.debt.delegate = this;
  }

  Debt getDebt() {
    return debt;
  }

  @override
  void debtExtinguished() {
    historyDebt.add(debt);
    debt = null;
  }
}