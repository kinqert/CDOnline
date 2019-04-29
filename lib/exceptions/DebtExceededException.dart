class DebtExceededException implements Exception {
  final String message;

  const DebtExceededException(this.message);

  @override
  toString() => message;
}