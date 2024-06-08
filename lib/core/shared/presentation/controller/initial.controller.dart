import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:supermarket_flutter/core/config/storage/app.secure_storage.dart';

import '../../../../entity/user.dart';
import 'usuario_logado.controller.dart';

class InitialController extends GetxController {
  final usuarioController = Get.find<UsuarioLogadoController>();
  var secureStorage = Get.find<AppSecureStorage>();

  @override
  void onInit() {
    super.onInit();
    initializeUser();
  }

  void initializeUser() async {
    String? token = await secureStorage.getToken();
    if (token != null && token.isNotEmpty) {
      String? userStored = await secureStorage.getUser();
      try {
        Map<String, dynamic> userMap = jsonDecode(userStored!);
        User usuario = UserExtension.fromMap(userMap);
        usuarioController.logIn(usuario);
      } catch (e) {
        rethrow;
      }
    }
    else {
      usuarioController.logOut();
    }
  }
}
