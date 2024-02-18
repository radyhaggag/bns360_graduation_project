import 'package:flutter/material.dart';

import '../databases/local_storage/hive_manager.dart';
import '../databases/secure_storage/secure_storage_manager.dart';
import '../utils/enums.dart';

class CacheHelper {
  final SecureStorageManager storage;

  CacheHelper(this.storage);

  Locale getCachedLanguage() {
    final code = HiveBoxes.language.get(CacheKeys.cachedLangCode);
    if (code != null) return Locale(code);
    return const Locale('en');
  }

  Future<void> cacheLanguage(Locale local) async {
    await HiveBoxes.language.put(
      CacheKeys.cachedLangCode,
      local.languageCode,
    );
  }

  Future<void> cacheTheme(AppTheme theme) async {
    await HiveBoxes.language.put(CacheKeys.cachedTheme, theme.name);
  }

  AppTheme getTheme() {
    final themeName = HiveBoxes.language.get(CacheKeys.cachedTheme);
    if (themeName == AppTheme.dark.name) return AppTheme.dark;
    return AppTheme.light;
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

abstract class CacheKeys {
  static const String cachedLangCode = "cachedLangCode";
  static const String cachedTheme = "cachedTheme";
}
