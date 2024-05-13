extension MobileNumbersExtension on String? {
  String get withoutCountryCode {
    if (this == null) return "";
    return this!.substring(3);
  }

  String get withCountryCode {
    return "+20\$${this ?? ""}";
  }
}
