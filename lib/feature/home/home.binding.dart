import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'presentation/controller/home.controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // CONTROLLER
    Get.lazyPut<HomeController>(() => HomeController());

    // DATASOURCE

    // REPOSITORY

    // USECASE
  }
}
