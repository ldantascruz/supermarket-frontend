import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supermarket_flutter/core/shared/presentation/widget/_widget.dart';

import '../../../../entity/authentication.dart';
import '../../../../i18n/_i18n.dart';
import '../../../home/home.routes.dart';
import '../../authentication.routes.dart';
import '../../domain/usecase/do_login.usecase.dart';
import '../../domain/usecase/do_register.usecase.dart';

class AuthenticationController extends GetxController {
  DoLoginUsecase doLoginUsecase = Get.find<DoLoginUsecase>();
  DoRegisterUsecase doRegisterUsecase = Get.find<DoRegisterUsecase>();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCreateController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isObscureTextPasswordLogin = true.obs;
  RxBool isObscureTextPasswordRegister = true.obs;
  RxBool isObscureTextConfPasswordRegister = true.obs;

  RxBool isLoading = false.obs;


  void toggleObscureText({required TextEditingController controller}) {
    if(controller == passwordController) {
      isObscureTextPasswordLogin.value = !isObscureTextPasswordLogin.value;
    }
    else if(controller == confirmPasswordController) {
      isObscureTextConfPasswordRegister.value = !isObscureTextConfPasswordRegister.value;
    }
    else if(controller == passwordCreateController){
      isObscureTextPasswordRegister.value = !isObscureTextPasswordRegister.value;
    }
  }


  Future<void> doLogin() async {
    isLoading.value = true;
    try{
      if(loginFormKey.currentState!.validate()){
        final authentication = Authentication(
          email: emailController.text,
          password: passwordController.text,
        );

        isLoading.value = false;
        User? user = await doLoginUsecase(authentication);

        Get.offAllNamed(HomeRoutes.home, arguments: user);

      }
      else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }


  Future<void> doRegister({required BuildContext context}) async {
    isLoading.value = true;
    try{
      if(registerFormKey.currentState!.validate()){
        isLoading.value = false;

        User? user = await doRegisterUsecase(Authentication(
          email: emailController.text,
          password: passwordCreateController.text,
        ));

        showDialogSuccessWidget(
          context: context,
          title: R.strings.success,
          content: R.strings.registerSuccess,
          route: AuthenticationRoutes.login,
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