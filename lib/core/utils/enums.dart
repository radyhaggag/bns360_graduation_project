enum Language { arabic, english }

enum UserType { user, businessOwner, serviceProvider }

enum AppTheme {
  light(0),
  dark(1);

  const AppTheme(this.id);
  final int id;
}
