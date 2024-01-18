import 'package:bns360_graduation_project/config/injector_container.dart';
import 'package:bns360_graduation_project/core/helpers/cache_helper.dart';
import 'package:flutter/material.dart';

import '../utils/enums.dart';

abstract class LocalizationHelper {
  static Language get currentLanguage {
    final appLang = sl<CacheHelper>().getCachedLanguage();

    if (appLang == 'ar') {
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
    if (currentLanguage == Language.arabic) return ar;
    return en;
  }
}
