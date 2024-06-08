import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'domain/repository/authentication.repository.dart';
import 'domain/usecase/do_login.usecase.dart';
import 'domain/usecase/do_register.usecase.dart';
import 'external/datasource/authentication.datasource.impl.dart';
import 'infra/datasource/authentication.datasource.dart';
import 'infra/repository/authentication.repository.impl.dart';
import 'presentation/controller/authentication.controller.dart';



class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    // CONTROLLER
    Get.lazyPut<AuthenticationController>(() => AuthenticationController());

    // DATASOURCE
    Get.lazyPut<AuthenticationDatasource>(() => AuthenticationDatasourceImpl(Get.find()));

    // REPOSITORY
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepositoryImpl(Get.find<AuthenticationDatasource>()));

    // USECASE
    Get.put<DoLoginUsecase>(DoLoginUsecase(Get.find<AuthenticationRepository>()));
    Get.put<DoRegisterUsecase>(DoRegisterUsecase(Get.find<AuthenticationRepository>()));

  }
}
