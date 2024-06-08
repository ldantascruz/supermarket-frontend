import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supermarket_flutter/core/exception/map.exception.dart';
import 'package:supermarket_flutter/entity/authentication.dart';

import '../../../../entity/user.dart';
import '../../domain/usecase/do_login.usecase.dart';
import '../../domain/usecase/do_register.usecase.dart';

class AuthenticationController extends GetxController {
  final DoLoginUsecase doLoginUsecase = Get.find<DoLoginUsecase>();
  final DoRegisterUsecase doRegisterUsecase = Get.find<DoRegisterUsecase>();

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isObscureText = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void toggleObscureText() {
    isObscureText.value = !isObscureText.value;
  }

  Future<User> doLogin() async {
    isLoading.value = true;
    try{
      if(formKey.currentState!.validate()){
        final authentication = Authentication(
          email: emailController.text,
          password: passwordController.text,
        );
        isLoading.value = false;
        return await doLoginUsecase(authentication: authentication);
      }
      else {
        isLoading.value = false;
    throw Exception('Erro inesperado');
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<User> doRegister() async {
    isLoading.value = true;
    try{
      if(!formKey.currentState!.validate()){
        isLoading.value = false;
        final newUser = User(
          name: nameController.text,
          email: emailController.text,
          passwordHash: passwordController.text,
        );
        isLoading.value = false;
        return await doRegisterUsecase(newUser: newUser);
      }
      else {
        isLoading.value = false;
        throw UnauthorizedException();
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
}