import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/shared/presentation/controller/user_logged.controller.dart';
import '../../../authentication/authentication.routes.dart';

class HomeController extends GetxController {
  final UserLoggedController usuarioController = Get.find<UserLoggedController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout() {
    usuarioController.logOut();
    Get.offAllNamed(AuthenticationRoutes.authentication);
  }
}