import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:supermarket_flutter/core/shared/presentation/widget/show.custom_dialog_error.widget.dart';

import '../config/constants/app.colors.dart';

class MapException implements Exception {
  final Exception exception;
  final StackTrace stackTrace;
  final DateTime date = DateTime.now();

  MapException(this.exception, this.stackTrace);

  @override
  String toString() {
    return '$exception\n$stackTrace';
  }
}

class UnauthorizedException implements Exception {
  final String? message;
  UnauthorizedException({this.message});

  void printError() => showCustomDialogError(title: 'Erro 401', content: message ?? 'Usuário / Senha inválidos', buttonText: 'OK');

  @override
  String toString() {
    printError();
    return 'Usuário não autorizado';
  }
}

class NotFoundException implements Exception {
  final String? message;
  NotFoundException({this.message});

  void printError() => showCustomDialogError(title: 'Erro 404', content: message ?? 'Recurso não encontrado', buttonText: 'OK');

  @override
  String toString() {
    printError();
    return 'Recurso não encontrado';
  }
}

class ServerException implements Exception {
  final String? message;
  ServerException({this.message});

  void printError() => showCustomDialogError(title: 'Erro 500', content: message ?? 'Erro interno no servidor', buttonText: 'OK');

  @override
  String toString() {
    printError();
    return 'Erro interno no servidor';
  }
}

class BadRequestException implements Exception {
  final String? message;
  BadRequestException({this.message});

  void printError() => showCustomDialogError(title: 'Erro 422', content: message ?? 'Requisição inválida', buttonText: 'OK');

  @override
  String toString() {
    printError();
    return 'Requisição inválida';
  }
}

class ForbiddenException implements Exception {
  final String? message;
  ForbiddenException({this.message});

  void printError() => showCustomDialogError(title: 'Erro 403', content: message ?? 'Acesso negado', buttonText: 'OK');

  @override
  String toString() {
    printError();
    return 'Acesso negado';
  }
}
