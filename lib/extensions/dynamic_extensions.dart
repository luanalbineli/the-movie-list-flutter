extension DynamicExtensions on dynamic {
  DateTime parseDateTime() {
    return DateTime.parse(this);
  }
}