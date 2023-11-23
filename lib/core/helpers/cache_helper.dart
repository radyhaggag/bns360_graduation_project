import '../databases/local_storage/hive_manager.dart';
import '../databases/secure_storage/secure_storage_manager.dart';

class CacheHelper {
  final SecureStorageManager storage;

  CacheHelper(this.storage);

  static const String _cachedLangCode = "cachedLangCode";

  String getCachedLanguage() {
    final code = HiveBoxes.languageBox.get(_cachedLangCode);
    if (code != null) {
      return code;
    } else {
      return 'ar';
    }
  }

  Future<void> cacheLanguage(String code) async {
    await HiveBoxes.languageBox.put(_cachedLangCode, code);
  }

  Future<String?> getToken() async {
    final token = await storage.read(key: 'token');
    return token;
  }

  Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken(String token) async {
    await storage.delete(key: 'token');
  }
}
