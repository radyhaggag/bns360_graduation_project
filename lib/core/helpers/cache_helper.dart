import 'dart:io';

import 'package:flutter/material.dart';

import '../databases/local_storage/hive_manager.dart';
import '../databases/secure_storage/secure_storage_manager.dart';
import '../utils/enums.dart';

class CacheHelper {
  final SecureStorageManager storage;

  CacheHelper(this.storage);

  Locale getCachedLanguage() {
    final cachedCode = HiveBoxes.language.get(CacheKeys.cachedLangCode);
    if (cachedCode != null) return Locale(cachedCode);
    
    final deviceLanguage = Platform.localeName.substring(0, 2);
    return Locale(deviceLanguage);
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
    final cachedTheme = HiveBoxes.language.get(CacheKeys.cachedTheme);
    if (cachedTheme == null) {
      return _deviceTheme;
    }
    if (cachedTheme == AppTheme.dark.name) return AppTheme.dark;
    return AppTheme.light;
  }

  AppTheme get _deviceTheme {
    final deviceMode =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (deviceMode == Brightness.dark) {
      return AppTheme.dark;
    } else {
      return AppTheme.light;
    }
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
