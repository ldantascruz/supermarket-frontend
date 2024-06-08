import 'package:dio/dio.dart';
import 'package:dson_adapter/dson_adapter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../shared/domain/repository/initial.repository.dart';
import '../../shared/external/datasource/initial.datasource.impl.dart';
import '../../shared/infra/datasource/initial.datasource.dart';
import '../../shared/infra/repository/initial.repository.impl.dart';
import '../../shared/presentation/controller/initial.controller.dart';
import '../../shared/presentation/controller/usuario_logado.controller.dart';
import '../storage/app.secure_storage.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<DSON>(const DSON());
    Get.put<AppSecureStorage>(AppSecureStorage());
    Get.put<UsuarioLogadoController>(UsuarioLogadoController());
    Get.put<InitialDatasource>(InitialDatasourceImpl(Get.find<Dio>()));
    Get.put<InitialRepository>(InitialRepositoryImpl(Get.find<InitialDatasource>()));
    Get.put<InitialController>(InitialController());
  }
}