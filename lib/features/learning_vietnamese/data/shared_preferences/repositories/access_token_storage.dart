import 'package:learning_vietnamese/core/util/storage_util.dart';

class AccessTokenStorage {
  static const String KEY = 'accessToken';

  StorageUtil _storage = StorageUtil();

  String get getToken => _storage.read(KEY);

  Future<void> updateToken(String token) async => await _storage.write(KEY, token);

  Future<void> deleteToken() async => await _storage.remove(KEY);
}