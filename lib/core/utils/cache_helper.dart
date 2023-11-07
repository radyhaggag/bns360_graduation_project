import '../../config/shared_preferences.dart';

class CacheHelper {
  final AppShared appShared;

  CacheHelper(this.appShared);

  static const String _cachedLangCode = "cachedLangCode";

  String getCachedLanguage() {
    final code = appShared.getString(key: _cachedLangCode);
    if (code != null) {
      return code;
    } else {
      return 'en';
    }
  }

  Future<void> cacheLanguage(String code) async {
    await appShared.setString(key: _cachedLangCode, value: code);
  }
}
