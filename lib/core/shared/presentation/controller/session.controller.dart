import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../config/constants/app.secure_storage.dart';

class SessionController extends GetxController{
  final supabase = Supabase.instance.client;

  AppSecureStorage secureStorage = Get.find<AppSecureStorage>();
  Rx<Session?> session = Rx<Session?>(null);

  void logIn(Session session) async {
    this.session.value = session;
    await secureStorage.saveSession(session);
  }

  void logOut() async {
    this.session.value = null;
    await secureStorage.deleteSession();
  }

  Future<Session?> getCurrentSession() async {
    final Session? session = supabase.auth.currentSession;

    if (session == null) {
      return null;
    } else {
      this.session.value = session;
      return this.session.value;
    }
  }

  bool get isLogged => this.session.value != null;
}