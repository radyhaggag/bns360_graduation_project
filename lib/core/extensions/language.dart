import 'package:flutter/widgets.dart';

import '../../config/injector_container.dart';
import '../helpers/cache_helper.dart';
import '../utils/enums.dart';

extension MediaQueryExtension on BuildContext {
  Language get currentLanguage => sl<CacheHelper>().getCachedLanguage() == "en"
      ? Language.english
      : Language.arabic;
}
