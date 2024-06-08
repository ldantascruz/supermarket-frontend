import 'package:dson_adapter/dson_adapter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../core/exception/map.exception.dart';
import '../authentication.dart';

extension AuthenticationExtension on Authentication {
  Authentication copyWith({
    String? email,
    String? password,
  }) {
    return Authentication(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    try {
      return {
        'email': email,
        'password': password,
      };
    } catch (e) {
      throw MapException(
        Exception('❌ Authentication.toMap: $e'),
        StackTrace.fromString(e.toString()),
      );
    }
  }

  static Authentication fromMap(Map<String, dynamic> map) {
    final pre = Get.find<DSON>();
    try {
      final authentication = pre.fromJson<Authentication>(
        map,
        Authentication.new,
        aliases: {
          Authentication: {
            'email': 'email',
            'password': 'password',
          },
        },
      );
      return authentication;
    } catch (e) {
      throw MapException(
        Exception('❌ Authentication.fromMap: $e'),
        StackTrace.fromString(e.toString()),
      );
    }
  }
}