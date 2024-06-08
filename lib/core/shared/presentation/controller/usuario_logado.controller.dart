import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../entity/user.dart';
import '../../../config/storage/app.secure_storage.dart';

class UsuarioLogadoController extends GetxController {
  final secureStorage = Get.find<AppSecureStorage>();

  Rx<User?> usuarioLogado = Rx<User?>(null);

  void logIn(User usuario) async {
    usuarioLogado.value = usuario;
    await secureStorage.saveUser(usuario);
  }

  void logOut() async {
    usuarioLogado.value = null;
    await secureStorage.deleteUser();
  }

  Future<User> getUserLogged() async {
    String? userStored = await secureStorage.getUser();
    try {
      Map<String, dynamic> userMap = jsonDecode(userStored!);
      User usuario = UserExtension.fromMap(userMap);
      usuarioLogado.value = usuario;
      return usuario;
    } catch (e) {
      print('🔴 Erro ao decodificar usuário: $e');
      secureStorage.deleteUser();
      rethrow;
    }
  }

  bool get isLogged => usuarioLogado.value?.token?.isNotEmpty ?? false;
}
