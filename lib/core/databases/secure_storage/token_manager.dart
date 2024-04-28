import 'secure_storage_manager.dart';

class TokenManager {
  final SecureStorageManager _storage;

  TokenManager({
    required SecureStorageManager storage,
  }) : _storage = storage;

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }
}
