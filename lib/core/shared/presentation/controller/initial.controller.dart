import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../config/constants/_constants.dart';
import 'session.controller.dart';
import 'user_logged.controller.dart';

class InitialController extends GetxController {
  final userLoggedController = Get.find<UserLoggedController>();
  final sessionController = Get.find<SessionController>();
  final secureStorage = Get.find<AppSecureStorage>();

  final supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    initializeSession();
    initializeUser();
  }

  void initializeSession() async {
    String? sessionString = await secureStorage.getSession();
    if (sessionString != null) {
      try {
        await sessionController.getCurrentSession();
      } catch (e) {
        secureStorage.deleteSession();
        rethrow;
      }
    } else {
      sessionController.logOut();
    }
  }

  void initializeUser() async {
    String? userString = await secureStorage.getUser();
    if (userString != null) {
      try {
        await userLoggedController.getUserLogged();
      } catch (e) {
        secureStorage.deleteUser();
        rethrow;
      }
    } else {
      userLoggedController.logOut();
    }
  }


}