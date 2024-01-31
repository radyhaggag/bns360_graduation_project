import '../utils/enums.dart';
import 'package:flutter/material.dart';

import '../databases/local_storage/hive_manager.dart';
import '../databases/secure_storage/secure_storage_manager.dart';

class CacheHelper {
  final SecureStorageManager storage;

  CacheHelper(this.storage);

  Locale getCachedLanguage() {
    final code = HiveBoxes.languageBox.get(CacheKeys.cachedLangCode);
    if (code != null) return Locale(code);
    return const Locale('en');
  }

  Future<void> cacheLanguage(Locale local) async {
    await HiveBoxes.languageBox.put(
      CacheKeys.cachedLangCode,
      local.languageCode,
    );
  }

  Future<void> cacheTheme(AppTheme theme) async {
    await HiveBoxes.languageBox.put(CacheKeys.cachedTheme, theme.name);
  }

  AppTheme getTheme() {
    final themeName = HiveBoxes.languageBox.get(CacheKeys.cachedTheme);
    if (themeName == AppTheme.light.name) return AppTheme.light;
    return AppTheme.dark;
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
