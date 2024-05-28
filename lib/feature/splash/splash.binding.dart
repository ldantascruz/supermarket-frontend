import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'presentation/controller/splash.controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // CONTROLLER
    Get.lazyPut<SplashController>(() => SplashController());

    // DATASOURCE

    // REPOSITORY

    // USECASE
  }
}
