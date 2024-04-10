import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStoragesManager {
  // final _secureStorage = const FlutterSecureStorage();
  // final _secureStorage = const FlutterSecureStorage();
  SecureStoragesManager({required this.secureStorage});

  // static FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
  late final FlutterSecureStorage secureStorage;

  Future<void> writeData({
    required String key,
    required String value,
  }) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> getData({
    required String key,
  }) async {
    return secureStorage.read(key: key);
  }
}
