import 'package:get_storage/get_storage.dart';

class Cache {
  Cache._();

  static late final GetStorage _storage;
  static const _container = 'container';

  static Future<void> init() async {
    await GetStorage.init(_container);
    _storage = GetStorage(_container);
  }

  static Future<String?> getToken() async {
    return _storage.read<String>('auth:user:token');
  }

  static Future<void> setToken(String token) async {
    await _storage.write('auth:user:token', token);
  }

  static Future<void> clearToken() async {
    await _storage.remove('auth:user:token');
  }

  static Future<int?> getUserID() async {
    return _storage.read<int>('auth:user:id');
  }

  static Future<void> setUserID(int id) async {
    await _storage.write('auth:user:id', id);
  }

  static Future<void> clearUserID() async {
    await _storage.remove('auth:user:id');
  }
}
