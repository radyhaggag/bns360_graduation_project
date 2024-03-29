import 'package:intl/intl.dart';

import '../utils/extensions/validators.dart';

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
    if (value == null || value.length <= 8) {
      return Intl.message(
        'Password must be at least 8 characters',
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

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Intl.message(
        'Field is required',
        name: 'validateEmpty',
      );
    }

    // Split the full name into individual names
    List<String> names = value.split(' ');

    // Check if there are at least two names
    if (names.length < 2) {
      return Intl.message(
        'Please enter at least two names (first and last)',
        name: 'validateTwoNames',
      );
    }

    // Check if each name is valid (English letters or Arabic)
    for (String name in names) {
      if (!_isEnglishOrArabic(name)) {
        return Intl.message(
          'Invalid name format. Use English or Arabic letters only.',
          name: 'validateInvalidNameFormat',
        );
      }
    }

    return null;
  }

  static bool _isEnglishOrArabic(String value) {
    // Regular expression to match English and Arabic letters
    final RegExp regex = RegExp(r'^[a-zA-Z\u0600-\u06FF]+$');
    return regex.hasMatch(value);
  }
}
