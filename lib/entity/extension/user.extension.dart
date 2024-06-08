import 'package:dson_adapter/dson_adapter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../core/exception/map.exception.dart';
import '../user.dart';

extension UserExtension on User {
  User copyWith({
    String? id,
    String? email,
    String? name,
    String? passwordHash,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      passwordHash: passwordHash ?? this.passwordHash,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    try {
      return {
        'id': id,
        'email': email,
        'name': name,
        'passwordHash': passwordHash,
        'token': token,
      };
    } catch (e) {
      throw MapException(
        Exception('❌ Usuario.toMap: $e'),
        StackTrace.fromString(e.toString()),
      );
    }
  }

  static User fromMap(Map<String, dynamic> map) {
    final pre = Get.find<DSON>();
    try {
      final usuario = pre.fromJson<User>(
        map,
        User.new,
        aliases: {
          User: {
            'id': 'id',
            'email': 'email',
            'name': 'name',
            'passwordHash': 'passwordHash',
            'token': 'token',
          },
        },
      );
      return usuario;
    } catch (e) {
      throw MapException(
        Exception('❌ Usuario.fromMap: $e'),
        StackTrace.fromString(e.toString()),
      );
    }
  }
}