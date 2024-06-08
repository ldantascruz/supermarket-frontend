import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../entity/user.dart';

class AppSecureStorage {
  static const _storage = FlutterSecureStorage();

  AndroidOptions _secureOption() => const AndroidOptions(encryptedSharedPreferences: false);

  Future<Map<String, String>> readAll() async {
    var map = <String, String>{};
    try {
      map = await _storage.readAll();
    } catch (e) {
      rethrow;
    }
    return map;
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
      readAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> readSecureData(String key) async {
    String value = "";
    try {
      value = (await _storage.read(key: key)) ?? "";
    } catch (e) {
      rethrow;
    }
    return value;
  }

  Future<void> deleteSecureData(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> writeSecureData(String key, String value) async {
    try {
      await _storage.write(key: key, value: value, aOptions: _secureOption());
    } catch (e) {
      rethrow;
    }
  }

// TOKEN RELATED
  Future<void> saveToken(String token) async {
    try {
      await writeSecureData('userToken', token);
      debugPrint('🟢 Token salvo: $token');
    } catch (e) {
      debugPrint('🔴 Erro ao salvar token: ${e.toString()}');
    }
  }

  Future<String?> getToken() async {
    try {
      final userToken = await readSecureData('userToken');
      debugPrint('🟢 Token lido: $userToken');
      return userToken;
    } catch (e) {
      debugPrint('🔴 Erro ao ler token: ${e.toString()}');
      return null;
    }
  }

  Future<void> deleteToken() async {
    try {
      await deleteSecureData('userToken');
      debugPrint('🟢 Token deletado');
    } catch (e) {
      debugPrint('🔴 Erro ao deletar token: ${e.toString()}');
    }
  }

  // USER RELATED
  Future<void> saveUser(User usuario) async {
    try {
      saveToken(usuario.token!);
      await writeSecureData('user', jsonEncode(usuario.toMap()));
      debugPrint('🟢 Usuário salvo: ${usuario.toMap()}');
    } catch (e) {
      debugPrint('🔴 Erro ao salvar usuário: ${e.toString()}');
    }
  }

  Future<String?> getUser() async {
    try {
      final user = await _storage.read(key: 'user');
      debugPrint('🟢 Usuário lido: $user');
      return user;
    } catch (e) {
      debugPrint('🔴 Erro ao ler usuário: ${e.toString()}');
      return null;
    }
  }

  Future<void> deleteUser() async {
    try {
      await deleteToken();
      await _storage.delete(key: 'user');
      debugPrint('🟢 Usuário deletado');
    } catch (e) {
      debugPrint('🔴 Erro ao deletar usuário: ${e.toString()}');
    }
  }
}