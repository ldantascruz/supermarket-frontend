import 'package:dio/dio.dart' as dio;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../../core/config/constants/app.endpoints.dart';
import '../../../../core/exception/map.exception.dart';
import '../../../../core/shared/presentation/controller/usuario_logado.controller.dart';
import '../../../../entity/authentication.dart';
import '../../../../entity/user.dart';
import '../../infra/datasource/authentication.datasource.dart';

class AuthenticationDatasourceImpl implements AuthenticationDatasource {
  final dio.Dio httpClient;
  final UsuarioLogadoController usuarioLogadoController = Get.find<UsuarioLogadoController>();

  AuthenticationDatasourceImpl(this.httpClient);

  Future<dio.Options> getOptions() async {
    final Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Connection': 'keep-alive',
      'Accept-Encoding': 'gzip, deflate, br',
    };
    return dio.Options(headers: headers, responseType: dio.ResponseType.json);
  }

  @override
  Future<User> doLogin({required Authentication authentication}) async {
    String uri = AppEndpoints.baseUrl + AppEndpoints.login;
    try {
      var response = await httpClient.post(
        uri,
        data: authentication.toMap(),
        options: await getOptions(),
      );

      final user =  UserExtension.fromMap(response.data);
      usuarioLogadoController.logIn(user);

      return user;
    } on dio.DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw UnauthorizedException();
      } else if (e.response!.statusCode == 404) {
        throw NotFoundException();
      } else if (e.response!.statusCode == 500) {
        throw ServerException();
      } else {
        throw Exception('Erro inesperado');
      }
    }
  }

  @override
  Future<User> doRegister({required User newUser}) async {
    String uri = AppEndpoints.baseUrl + AppEndpoints.users;
    try {
      var response = await httpClient.post(
        uri,
        data: newUser.toMap(),
        options: await getOptions(),
      );

      final user =  UserExtension.fromMap(response.data);
      usuarioLogadoController.logIn(user);

      return user;
    } on dio.DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw UnauthorizedException();
      } else if (e.response!.statusCode == 404) {
        throw NotFoundException();
      } else if (e.response!.statusCode == 500) {
        throw ServerException();
      } else {
        throw Exception('Erro inesperado');
      }
    }
  }
}
