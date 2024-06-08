import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supermarket_flutter/core/exception/map.exception.dart';
import 'package:supermarket_flutter/core/shared/presentation/widget/show.custom_dialog_error.widget.dart';
import 'package:supermarket_flutter/entity/authentication.dart';

import '../../../../entity/user.dart';
import '../../../home/home.routes.dart';
import '../../authentication.routes.dart';
import '../../domain/usecase/do_login.usecase.dart';
import '../../domain/usecase/do_register.usecase.dart';
import '../../../../core/shared/presentation/widget/show.custom_dialog_success.widget.dart';

class AuthenticationController extends GetxController {
  final DoLoginUsecase doLoginUsecase = Get.find<DoLoginUsecase>();
  final DoRegisterUsecase doRegisterUsecase = Get.find<DoRegisterUsecase>();

  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isObscureTextPasswordLogin = true.obs;
  RxBool isObscureTextPasswordRegister = true.obs;
  RxBool isObscureTextConfPasswordRegister = true.obs;


  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void toggleObscureTextPasswordLogin() => isObscureTextPasswordLogin.value = !isObscureTextPasswordLogin.value;

  void toggleObscureTextPasswordRegister() => isObscureTextPasswordRegister.value = !isObscureTextPasswordRegister.value;

  void toggleObscureTextConfPasswordRegister() => isObscureTextConfPasswordRegister.value = !isObscureTextConfPasswordRegister.value;

  Future<User> doLogin() async {
    isLoading.value = true;
    try{
      if(loginFormKey.currentState!.validate()){
        final authentication = Authentication(
          email: emailController.text,
          password: passwordController.text,
        );
        isLoading.value = false;
        final user =  await doLoginUsecase(authentication: authentication);
        Get.offAllNamed(HomeRoutes.home);
        return user;
      }
      else {
        isLoading.value = false;
        return Future.error('Erro inesperado');
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<User> doRegister({required BuildContext context}) async {
    isLoading.value = true;
    try{
      if(registerFormKey.currentState!.validate()){
        isLoading.value = false;
        final newUser = User(
          name: nameController.text,
          email: emailController.text,
          passwordHash: passwordController.text,
        );
        isLoading.value = false;

        final user = await doRegisterUsecase(newUser: newUser);
        showCustomDialogSuccess(
          context: context,
          title: 'Sucesso!',
          content: 'Cadastro realizado com sucesso!',
          route: AuthenticationRoutes.login,
        );
        return user;
      }
      else {
        isLoading.value = false;
        return Future.error('Erro inesperado');
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }



}