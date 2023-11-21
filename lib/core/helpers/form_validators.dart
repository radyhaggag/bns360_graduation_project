import 'package:intl/intl.dart';

import '../extensions/validators.dart';

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
        'Field is required',
        name: 'validateEmpty',
      );
    } else if (!value.isEmail()) {
      return Intl.message(
        'Enter a valid email address',
        name: 'validateEmail',
      );
    }
    return null;
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

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    // Regular expression for Egypt phone number
    // The format: +2001XXXXXXXXX

    if (!value.isPhone()) {
      return Intl.message(
        'Invalid phone number',
        name: 'validatePhone',
      );
    }

    return null;
  }
}
