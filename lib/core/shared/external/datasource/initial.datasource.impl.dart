import 'package:dio/dio.dart' as dio;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../infra/datasource/initial.datasource.dart';
import '../../presentation/controller/usuario_logado.controller.dart';

class InitialDatasourceImpl implements InitialDatasource {
  final dio.Dio httpClient;
  final UsuarioLogadoController usuarioLogadoController =
  Get.find<UsuarioLogadoController>();

  InitialDatasourceImpl(this.httpClient);

  Future<dio.Options> getOptions() async {
    final Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Connection': 'keep-alive',
      'Accept-Encoding': 'gzip, deflate, br',
    };
    return dio.Options(headers: headers, responseType: dio.ResponseType.json);
  }
}



