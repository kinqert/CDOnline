import 'package:flutter/material.dart';
import 'package:cdonline/operations/Debt.dart';

class Contact {
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
}