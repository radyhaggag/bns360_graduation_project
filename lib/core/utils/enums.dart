enum Language {
  arabic("اللغة العربية"),
  english("English");

  const Language(this.message);

  final String message;
}

enum UserType {
  user(0),
  serviceProvider(1),
  businessOwner(2);

  const UserType(this.id);
  final int id;
}

enum AppTheme {
  light(0),
  dark(1);

  const AppTheme(this.id);
  final int id;
}
