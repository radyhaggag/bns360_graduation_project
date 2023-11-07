import 'package:shared_preferences/shared_preferences.dart';

class AppShared {
  late SharedPreferences sharedPreferences;

  AppShared({required this.sharedPreferences});

  Future<bool> setString({required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  Future<bool> setInt({required String key, required int value}) async {
    return await sharedPreferences.setInt(key, value);
  }

  String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  int? getInt({required String key}) {
    return sharedPreferences.getInt(key);
  }

  Future<bool> clear({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> clearAll() async {
    return await sharedPreferences.clear();
  }
}
