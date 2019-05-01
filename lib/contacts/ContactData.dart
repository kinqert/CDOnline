class ContactData {
  final int id;
  final String name;
  final String lastName;
  final String phone;
  final String address;
  final String note;

  ContactData({this.id, this.name, this.lastName, this.phone, this.address, this.note});

  static ContactData getDefalut() {
    return ContactData(
        name: "Nome",
        lastName: "Cognome",
        phone: "000-000-000",
        address: "Indirizzo civico",
        note: "Descrizone contatto");
  }
}
