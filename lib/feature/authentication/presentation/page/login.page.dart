import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/config/constants/app.colors.dart';
import '../../../../core/shared/presentation/widget/elevated_button.widget.dart';
import '../../../../core/shared/presentation/widget/text_form_field.widget.dart';
import '../../../../core/util/validator/email_validator.dart';
import '../../../../core/util/validator/password_validator.dart';
import '../../../../i18n/_i18n.dart';
import '../../authentication.routes.dart';
import '../controller/authentication.controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 189.h),
                ClipRRect(borderRadius: BorderRadius.circular(32.r), child: Image.asset('assets/images/icon_transparent_2.png', width: 100.w)),
                SizedBox(height: 42.h),
                Text(R.strings.login, textAlign: TextAlign.center, style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
                SizedBox(height: 42.h),
                Form(
                  key: controller.loginFormKey,
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        labelText: R.strings.email,
                        hintText: R.strings.emailHint, // 'Digite aqui o seu e-mail'
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: controller.emailController,
                        validator: (email) => EmailValidator().validate(email: email),
                      ),
                      SizedBox(height: 16.h),
                      Obx(() {
                        return TextFormFieldWidget(
                          labelText: R.strings.password,
                          hintText: R.strings.passwordHint, // 'Digite aqui a sua senha'
                          controller: controller.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.none,
                          obscureText: controller.isObscureTextPasswordLogin.value,
                          suffixIcon: InkWell(
                            onTap: () => controller.toggleObscureTextPasswordLogin(),
                            child: controller.isObscureTextPasswordLogin.value
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
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                ElevatedButtonWidget(onTap: () async {
                  FocusScope.of(context).unfocus();
                  return await controller.doLogin();
                }, text: R.strings.login),
                SizedBox(height: 32.h),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Get.toNamed(AuthenticationRoutes.register);
                  },
                  child: Text.rich(
                    TextSpan(text: R.strings.notRegistered,  // 'Não tem uma conta? ',
                      children: [
                        TextSpan(
                          text: R.strings.register, // 'Cadastre-se',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          )),
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
    );
  }
}
