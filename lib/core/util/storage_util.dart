import 'package:get_storage/get_storage.dart';

import 'logging.dart';

class StorageUtil {
  static Future init() async => await GetStorage.init();

  GetStorage get _storage => GetStorage();

  dynamic read(String key) => _storage.read(key);

  /// Can store String, int, double, Map and List
  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
    logging('$key : $value', name: 'StorageUtil - write');
  }

  Future<void> remove(String key) async => await _storage.remove(key);
}