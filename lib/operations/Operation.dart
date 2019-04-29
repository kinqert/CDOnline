enum OperationDirection {
  FromUserToContact, FromContactToUser
}

abstract class Operation {
  double getAmount();
  DateTime getDate();
}