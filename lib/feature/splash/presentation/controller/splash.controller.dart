import 'package:flutter/animation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../core/shared/presentation/controller/usuario_logado.controller.dart';
import '../../../authentication/authentication.routes.dart';
import '../../../home/home.routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> logoAnimation;
  late Animation<double> textAnimation;

  final usuarioController = Get.find<UsuarioLogadoController>();

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    animationController.forward().then(
          (value) => Future.delayed(
            Duration(seconds: 2),
            () => checkAuthentication(),
          ),
        );
  }

  void checkAuthentication() async {
    final isLoggedIn = await usuarioController.isLogged;
    if (isLoggedIn) {
      Get.offAllNamed(HomeRoutes.home, arguments: usuarioController.usuarioLogado);
    } else {
      Get.offAllNamed(AuthenticationRoutes.login);
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
