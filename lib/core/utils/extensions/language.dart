import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app_bloc.dart';
import '../enums.dart';

extension MediaQueryExtension on BuildContext {
  Language get currentLanguage {
    final cachedLang = read<AppBloc>().state.locale;

    if (cachedLang.languageCode == 'en') {
      return Language.english;
    } else {
      return Language.arabic;
    }
  }
}

extension TextLanguage on String {
  Language get detectLanguage {
    bool isArabic = RegExp(
      r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]',
    ).hasMatch(this);

    if (isArabic) {
      return Language.arabic;
    } else {
      return Language.english;
    }
  }
}

extension LanguageLocale on Language {
  Locale? get locale {
    switch (this) {
      case Language.arabic:
        return const Locale("ar");
      case Language.english:
        return const Locale("en");
    }
  }
}
