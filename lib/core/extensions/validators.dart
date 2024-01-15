extension FormValidatorExtension on String {
  bool isEmail() {
    final emailFormat = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailFormat.hasMatch(this);
  }

  bool isPhone() {
    final phoneFormat = RegExp(r'^\+20(10|11|12|15)\d{8}$');
    return phoneFormat.hasMatch(this);
  }
}
