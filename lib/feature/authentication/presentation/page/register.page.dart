import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/config/constants/app.colors.dart';
import '../../../../core/shared/presentation/widget/elevated_button.widget.dart';
import '../../../../core/shared/presentation/widget/text_form_field.widget.dart';
import '../../../../core/util/validator/confirm_password_validator.dart';
import '../../../../core/util/validator/email_validator.dart';
import '../../../../core/util/validator/name_validator.dart';
import '../../../../core/util/validator/password_validator.dart';
import '../../../../i18n/_i18n.dart';
import '../controller/authentication.controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32.r),
                    child: Image.asset(
                      'assets/images/icon_transparent_2.png',
                      width: 200.w,
                    ),
                  ),
                  Text(
                    R.strings.register,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Form(
                    key: controller.registerFormKey,
                    child: Column(
                      children: [
                        TextFormFieldWidget(
                          labelText: R.strings.name,
                          hintText: R.strings.nameHint, //'Insira o seu nome completo',
                          keyboardType: TextInputType.text,
                          controller: controller.nameController,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          validator: (name) => NameValidator().validate(name: name)
                        ),
                        SizedBox(height: 16.h),
                        TextFormFieldWidget(
                          labelText: R.strings.email,
                          hintText: R.strings.emailHint, // 'Insira o seu e-mail',
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          validator: (email) => EmailValidator().validate(email: email),
                        ),
                        SizedBox(height: 16.h),
                        Obx(() {
                          return TextFormFieldWidget(
                            labelText: R.strings.password,
                            hintText: R.strings.createPasswordHint, // 'Crie uma senha',
                            controller: controller.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.isObscureTextPasswordRegister.value,
                            textInputAction: TextInputAction.next,
                            suffixIcon: InkWell(
                              onTap: () => controller.toggleObscureTextPasswordRegister(),
                              child: controller.isObscureTextPasswordRegister.value
                                  ? Icon(
                                Icons.visibility_off,
                                size: 24.sp,
                                color: AppColors.primaryColor,
                              )
                                  : Icon(
                                Icons.visibility,
                                size: 24.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            validator: (password) => PasswordValidator().validate(password: password),
                          );
                        }),
                        SizedBox(height: 16.h),
                        Obx(() {
                          return TextFormFieldWidget(
                            labelText: R.strings.confirmPasswordHint,
                            hintText: R.strings.confirmPasswordHint, // 'Confirme a sua senha',
                            controller: controller.confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.isObscureTextConfPasswordRegister.value,
                            textInputAction: TextInputAction.done,
                            suffixIcon: InkWell(
                              onTap: () => controller.toggleObscureTextConfPasswordRegister(),
                              child: controller.isObscureTextConfPasswordRegister.value
                                  ? Icon(
                                Icons.visibility_off,
                                size: 24.sp,
                                color: AppColors.primaryColor,
                              )
                                  : Icon(
                                Icons.visibility,
                                size: 24.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            validator: (myConfPassword) => ConfirmPasswordValidator().validate(password: controller.passwordController.text, confirmPassword: myConfPassword),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  ElevatedButtonWidget(
                      onTap: () async {
                        await controller.doRegister(context: context);
                        // showCustomDialogError(context: context, title: "Erro!", content: "E-mail já cadastrado", buttonText: "OK");
                      },
                      text: R.strings.register
                  ),
                  SizedBox(height: 32.h),
                  InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Get.back();
                    },
                    child: Text.rich(
                      TextSpan(
                        text: R.strings.alreadyRegistered, // 'Já tem uma conta? ',
                        children: [
                          TextSpan(
                            text: R.strings.doLogin, // 'Faça login',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
