extension EmailValidatorExtension on String {
  bool isValidEmail() {
    final emailFormat = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailFormat.hasMatch(this);
  }
}
