import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../i18n/_i18n.dart';
import '../config/constants/app.colors.dart';
import '../shared/presentation/widget/_widget.dart';

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

  void printError() => showDialogErrorWidget(
      context: Get.context!,
      title: '${R.strings.error} 401',
      content: message ?? R.strings.invalidUserOrPassword
  );

  @override
  String toString() {
    printError();
    return R.strings.invalidUserOrPassword;
  }
}

class NotFoundException implements Exception {
  final String? message;
  NotFoundException({this.message});

  void printError() => showDialogErrorWidget(
      context: Get.context!,
      title: '${R.strings.error} 404',
      content: message ?? R.strings.notFound
  );

  @override
  String toString() {
    printError();
    return R.strings.notFound;
  }
}

class ServerException implements Exception {
  final String? message;
  ServerException({this.message});

  void printError() => showDialogErrorWidget(
      context: Get.context!,
      title: '${R.strings.error} 500',
      content: message ?? R.strings.serverError
  );

  @override
  String toString() {
    printError();
    return R.strings.serverError;
  }
}

class BadRequestException implements Exception {
  final String? message;
  BadRequestException({this.message});

  void printError() => showDialogErrorWidget(
      context: Get.context!,
      title: '${R.strings.error} 400',
      content: message ?? R.strings.badRequest
  );

  @override
  String toString() {
    printError();
    return R.strings.badRequest;
  }
}

class ForbiddenException implements Exception {
  final String? message;
  ForbiddenException({this.message});

  void printError() => showDialogErrorWidget(
      context: Get.context!,
      title: '${R.strings.error} 403',
      content: message ?? R.strings.accessDenied
  );

  @override
  String toString() {
    printError();
    return R.strings.accessDenied;
  }
}
