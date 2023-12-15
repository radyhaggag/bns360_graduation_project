import 'package:flutter/material.dart';

import '../../config/injector_container.dart';
import 'cache_helper.dart';

String getLocalizedString(
  BuildContext context, {
  required String ar,
  required String en,
}) {
  final appLang = sl<CacheHelper>().getCachedLanguage();

  if (appLang == 'ar') return ar;
  return en;
}
