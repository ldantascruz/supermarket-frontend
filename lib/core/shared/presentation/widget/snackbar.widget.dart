import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../config/constants/app.colors.dart';

class SnackBarWidget {
  SnackBarWidget._();

  static void showSuccess(String message) {
    Get.snackbar(
      'Sucesso',
      message,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.whiteColor,
    );
  }

  static void showAlert(String message) {
    Get.snackbar(
      'Importante',
      message,
      backgroundColor: AppColors.warningColor,
      colorText: AppColors.whiteColor,
    );
  }

  static void showError(String message) {
    Get.snackbar(
      'Erro',
      message,
      backgroundColor: AppColors.errorColor,
      colorText: AppColors.whiteColor,
    );
  }
}
