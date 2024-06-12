import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../generated/l10n.dart';
import '../../utils/extensions/validators.dart';

class FormValidator {
  static final phoneFormatWithCountryCode = RegExp(r'^\+20(10|11|12|15)\d{8}$');
  static final phoneFormatWithoutCountryCode = RegExp(r'^(10|11|12|15)\d{8}$');

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

  static Map<String, String Function(Object)> validationMessages(
    BuildContext context, {
    bool isPhoneNumber = false,
  }) {
    final s = S.of(context);
    return {
      ValidationMessage.required: (_) => s.required_field_validation_message,
      ValidationMessage.pattern: (_) => isPhoneNumber ? s.validatePhone:s.pattern_validation_message,
      ValidationMessage.number: (_) => s.number_validation_message,
      ValidationMessage.mustMatch: (_) => s.mustMatch_validation_message,
      ValidationMessage.minLength: (error) {
        return s.minLength_validation_message((error as Map)['requiredLength']);
      },
      ValidationMessage.maxLength: (error) =>
          s.maxLength_validation_message((error as Map)['requiredLength']),
      ValidationMessage.email: (_) => s.email_validation_message,
      ValidationMessage.creditCard: (_) => s.creditCard_validation_message,
      // ValidationMessage.max: (_) => t.max_validation_message,
      // ValidationMessage.min: (_) => t.min_validation_message,
      ValidationMessage.equals: (_) => s.equals_validation_message,
      // ValidationMessage.requiredTrue: (_) => s.requiredTrue_validation_message,
      ValidationMessage.requiredTrue: (_) => s.required,
      ValidationMessage.compare: (_) => s.compare_validation_message,
      ValidationMessage.contains: (_) => s.contains_validation_message,
      ValidationMessage.any: (_) => s.any_validation_message,
    };
  }
}
