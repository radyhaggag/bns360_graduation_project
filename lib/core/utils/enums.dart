enum Language {
  arabic("اللغة العربية"),
  english("English");

  const Language(this.message);

  final String message;
}

enum AppTheme {
  light(0),
  dark(1);

  const AppTheme(this.id);
  final int id;
}
