extension MobileNumbersExtension on String? {
  String get withoutCountryCode {
    if (this == null) return "";
    return this!.substring(3);
  }

  String get withCountryCode {
    final number = this ?? "";
    return "+20$number";
  }
}
