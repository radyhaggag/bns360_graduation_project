import 'package:intl/intl.dart';

class FormValidator {
  static String? validateEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Intl.message(
        'Field is required',
        name: 'validateEmpty',
      );
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return Intl.message(
        'Email is required',
        name: 'validateEmail',
      );
    } else if (!_isEmailValid(value)) {
      return Intl.message(
        'Enter a valid email address',
        name: 'validateEmail',
      );
    }
    return null;
  }

  static bool _isEmailValid(String value) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(value);
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return Intl.message(
        'Password must be at least 6 characters',
        name: 'validatePassword',
      );
    }
    return null;
  }
}
