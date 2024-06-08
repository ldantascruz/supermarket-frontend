import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'presentation/controller/authentication.controller.dart';



class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    // CONTROLLER
    Get.lazyPut<AuthenticationController>(() => AuthenticationController());

    // DATASOURCE

    // REPOSITORY

    // USECASE
  }
}
