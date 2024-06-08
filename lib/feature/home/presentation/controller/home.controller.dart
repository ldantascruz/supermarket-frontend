import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/shared/presentation/controller/usuario_logado.controller.dart';
import '../../../authentication/authentication.routes.dart';

class HomeController extends GetxController {
  final UsuarioLogadoController usuarioController = Get.find<UsuarioLogadoController>();

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
    Get.offAllNamed(AuthenticationRoutes.login);
  }
}