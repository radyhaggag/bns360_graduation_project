import '../utils/enums.dart';
import 'package:flutter/material.dart';

extension LocalLanguageExtension on Locale {
  Language? get language {
    if (languageCode == "en") {
      return Language.english;
    }
    if (languageCode == "ar") {
      return Language.arabic;
    }
    return null;
  }
}
