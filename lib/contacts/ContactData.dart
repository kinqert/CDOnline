class ContactData {
  final String name;
  final String lastName;
  final String adress;
  final String note;

  ContactData({this.name, this.lastName, this.adress, this.note});

  static ContactData getDefalut() {
    return ContactData(name: "Nome", lastName: "Cognome", adress: "Indirizzo civico", note: "Descrizone contatto");
  }
}