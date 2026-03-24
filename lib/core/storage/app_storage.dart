import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class AppStorage {
  static const String _tokenKey = "bearer_token";
  static const String _userIdKey = "user_id";
  final storage = GetIt.I<FlutterSecureStorage>();
  Future<void> saveToken(String token) async {
    await storage.write(key: _tokenKey, value: token);
  }
  Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await storage.delete(key: _tokenKey);
  }

  Future<void> saveUserId(dynamic userId) async {
    await storage.write(key: _userIdKey, value: userId.toString());
  }

  Future<String?> getUserId() async {
    return await storage.read(key: _userIdKey);

  }
  Future<void> clearAll() async {
    await storage.deleteAll();
  }
}