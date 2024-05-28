import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  static const _storage = FlutterSecureStorage();

  AndroidOptions _secureOption() =>
      const AndroidOptions(encryptedSharedPreferences: false);


  Future<Map<String, String>> readAll() async {
    var map = <String, String>{};
    try {
      map = await _storage.readAll();
    } catch (e) {
      debugPrint(e as String?);
    }
    return map;
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
      readAll();
      debugPrint('🟢 Dados deletados com sucesso');
    } catch (e) {
      debugPrint('🔴 Erro ao deletar dados: ${e.toString()}');
    }
  }

  Future<String> readSecureData(String key) async {
    String value = "";
    try {
      value = (await _storage.read(key: key)) ?? "";
      debugPrint('🟢 Dados lidos com sucesso: $key - $value');
    } catch (e) {
      debugPrint('🔴 Erro ao ler dados: $key - ${e.toString()}');
    }
    return value;
  }

  Future<void> deleteSecureData(String key) async {
    try {
      await _storage.delete(key: key);
      debugPrint('🟢 Dados deletados com sucesso: $key');
    } catch (e) {
      debugPrint('🔴 Erro ao deletar dados: $key - ${e.toString()}');
    }
  }

  Future<void> writeSecureData(String key, String value) async {
    try {
      await _storage.write(key: key, value: value, aOptions: _secureOption());
      debugPrint('🟢 Dados salvos com sucesso: $key - $value');
    } catch (e) {
      debugPrint(e as String?);
      debugPrint('🔴 Erro ao salvar dados: $key - $value');
    }
  }

}