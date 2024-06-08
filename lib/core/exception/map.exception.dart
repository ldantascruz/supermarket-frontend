import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

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

  void printError() => Get.snackbar(
    'Erro 401',
    message ?? 'Usuário / Senha inválidos',
    backgroundColor: AppColors.errorColor,
    colorText: AppColors.whiteColor,
  );

  @override
  String toString() {
    printError();
    return 'Usuário não autorizado';
  }
}

class NotFoundException implements Exception {
  final String? message;
  NotFoundException({this.message});

  void printError() => Get.snackbar(
    'Erro 404',
    message ?? 'Recurso não encontrado',
    backgroundColor: AppColors.errorColor,
    colorText: AppColors.whiteColor,
  );

  @override
  String toString() {
    printError();
    return 'Recurso não encontrado';
  }
}

class ServerException implements Exception {
  final String? message;
  ServerException({this.message});

  void printError() => Get.snackbar(
    'Erro 500',
    message ?? 'Erro interno no servidor',
    backgroundColor: AppColors.errorColor,
    colorText: AppColors.whiteColor,
  );

  @override
  String toString() {
    printError();
    return 'Erro interno no servidor';
  }
}

class BadRequestException implements Exception {
  final String? message;
  BadRequestException({this.message});

  void printError() => Get.snackbar(
    'Erro 422',
    message ?? 'Requisição inválida',
    colorText: AppColors.whiteColor,
    backgroundColor: AppColors.errorColor,
  );

  @override
  String toString() {
    printError();
    return 'Requisição inválida';
  }
}

class ForbiddenException implements Exception {
  final String? message;
  ForbiddenException({this.message});

  void printError() => Get.snackbar(
    'Erro 403',
    message ?? 'Acesso negado',
  );

  @override
  String toString() {
    printError();
    return 'Acesso negado';
  }
}
