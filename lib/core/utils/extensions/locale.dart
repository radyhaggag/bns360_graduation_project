import 'package:flutter/material.dart';

import '../enums.dart';

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
