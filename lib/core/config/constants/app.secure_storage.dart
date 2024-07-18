import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


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

  // USER RELATED
  Future<void> saveUser(User? user) async {
    try {
      await _storage.write(key: 'user', value: jsonEncode(user?.toJson()), aOptions: _secureOption());
    } catch (e) {
      debugPrint('🔴 Erro ao salvar usuário: ${e.toString()}');
    }
  }

  Future<String?> getUser() async {
    try {
      final user = await _storage.read(key: 'user');
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteUser() async {
    try {
      await _storage.delete(key: 'user');
    } catch (e) {
      debugPrint('🔴 Erro ao deletar usuário: ${e.toString()}');
    }
  }

  // SESSION RELATED
  Future<void> saveSession(Session? session) async {
    try {
      await _storage.write(key: 'session', value: jsonEncode(session?.toJson()), aOptions: _secureOption());
    } catch (e) {
      debugPrint('🔴 Erro ao salvar sessão: ${e.toString()}');
    }
  }

  Future<String?> getSession() async {
    try {
      final session = await _storage.read(key: 'session');
      return session;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteSession() async {
    try {
      await _storage.delete(key: 'session');
    } catch (e) {
      debugPrint('🔴 Erro ao deletar sessão: ${e.toString()}');
    }
  }
}