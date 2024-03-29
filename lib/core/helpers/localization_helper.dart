import 'package:flutter/material.dart';

import '../../config/injector_container.dart';
import '../utils/enums.dart';
import 'cache_helper.dart';

abstract class LocalizationHelper {
  static Language get currentLanguage {
    final appLang = sl<CacheHelper>().getCachedLanguage();

    if (appLang.languageCode == 'ar') {
      return Language.arabic;
    } else {
      return Language.english;
    }
  }

  static String getLocalizedString(
    BuildContext context, {
    required String ar,
    required String en,
  }) {
    if (currentLanguage == Language.arabic) {
      return ar.isNotEmpty ? ar : en;
    }
    return en;
  }
}
