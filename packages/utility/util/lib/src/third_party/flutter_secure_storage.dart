import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:util/src/interface/storage.dart';

@LazySingleton(as: MDStorage)
class MDSecureStorage implements MDStorage {
  static MDSecureStorage? _instance;
  
  final FlutterSecureStorage _storage;

  factory MDSecureStorage() {
    _instance ??= MDSecureStorage._create();
    return _instance!;
  }

  factory MDSecureStorage._create() {
    AndroidOptions getAndroidOptions() =>
        const AndroidOptions(encryptedSharedPreferences: true);
    return MDSecureStorage._(FlutterSecureStorage(aOptions: getAndroidOptions()));
  }
  

  MDSecureStorage._(this._storage);

  @override
  Future<String?> read(String key) {
    return _storage.read(key: key);
  }
  @override
  Future<void> write(String key, String value) {
    return _storage.write(key: key, value: value);
  }
  @override
  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }
  @override
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }
}

void main(List<String> args) {
  final storage = MDSecureStorage();
  storage.write('key', 'value');
}
