import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supermarket_flutter/core/shared/presentation/widget/_widget.dart';

import '../../../../entity/authentication.dart';
import '../../../../i18n/_i18n.dart';
import '../../domain/usecase/authenticate.usecase.dart';

class AuthenticationController extends GetxController {
  AuthenticateUsecase authenticateUsecase = Get.find<AuthenticateUsecase>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isObscureTextPassword = true.obs;
  RxBool isObscureTextConfirmPassword = true.obs;

  RxBool isLoading = false.obs;
  RxBool isRegisterObs = false.obs;

  void toggleObscureText({required TextEditingController controller}) {
    if(controller == passwordController) {
      isObscureTextPassword.value = !isObscureTextPassword.value;
    }
    else if(controller == confirmPasswordController) {
      isObscureTextConfirmPassword.value = !isObscureTextConfirmPassword.value;
    }
  }

  void toggleRegister() {
    formKey.currentState!.reset();
    isRegisterObs.value = !isRegisterObs.value;
  }

  Future<void> authenticate({required BuildContext context, bool? isRegister}) async {
    FocusScope.of(context).unfocus();
    isLoading.value = true;
    try{
      if(registerFormKey.currentState!.validate()){
        isLoading.value = false;

        if(isRegister == true) {
          isRegisterObs.value = true;
          if(passwordController.text != confirmPasswordController.text) {
            showDialogErrorWidget(
              context: context,
              title: R.strings.error,
              content: R.strings.passwordNotMatch,
            );
            return;
          } else if(passwordController.text.length < 6) {
            showDialogErrorWidget(
              context: context,
              title: R.strings.error,
              content: R.strings.passwordLength,
            );
            return;
          }
        } else {
          isRegisterObs.value = false;
        }

        User? user = await authenticateUsecase(
          authentication: Authentication(
            email: emailController.text,
            password: passwordController.text,
          ),
          isRegister: isRegisterObs.value,
        );

      }
      else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
}