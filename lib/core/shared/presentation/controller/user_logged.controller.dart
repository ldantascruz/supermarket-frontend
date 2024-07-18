import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../config/constants/app.secure_storage.dart';

class UserLoggedController extends GetxController {
  final supabase = Supabase.instance.client;

  AppSecureStorage secureStorage = Get.find<AppSecureStorage>();
  Rx<User?> userLogged = Rx<User?>(null);

  void logIn(User usuario) async {
    userLogged.value = usuario;
    await secureStorage.saveUser(usuario);
  }

  void logOut() async {
    userLogged.value = null;
    await secureStorage.deleteUser();
  }

  Future<User?> getUserLogged() async {
    final User? user = supabase.auth.currentUser;

    if (user == null) {
      return null;
    } else {
      userLogged.value = user;
      return userLogged.value;
    }
  }

  bool get isLogged => userLogged.value != null;
}
