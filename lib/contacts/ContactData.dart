class ContactData {
  int id;
  String name;
  String lastName;
  String phone;
  String address;
  String note;

  ContactData({this.id, this.name, this.lastName, this.phone, this.address, this.note});

  static ContactData getDefalut() {
    return ContactData(
        name: "",
        lastName: "",
        phone: "",
        address: "",
        note: "");
  }
}
