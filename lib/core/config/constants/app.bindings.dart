import 'package:dio/dio.dart';
import 'package:dson_adapter/dson_adapter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../shared/presentation/controller/_controller.dart';
import 'app.secure_storage.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<DSON>(const DSON());
    Get.put<AppSecureStorage>(AppSecureStorage());

    Get.put<SessionController>(SessionController());
    Get.put<UserLoggedController>(UserLoggedController());
    Get.put<InitialController>(InitialController());
  }
}