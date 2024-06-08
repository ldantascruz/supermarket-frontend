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
import '../../authentication.routes.dart';
import '../controller/authentication.controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  SizedBox(height: 32.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32.r),
                    child: Image.asset(
                      'assets/images/icon.png',
                      width: 200.w,
                    ),
                  ),
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  TextFormFieldWidget(
                    labelText: 'E-mail',
                    hintText: 'Digite aqui o seu e-mail',
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 16.h),
                  Obx(() {
                    return TextFormFieldWidget(
                      labelText: 'Senha',
                      hintText: 'Digite aqui a sua senha',
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.obscureText.value,
                      suffixIcon: InkWell(
                        onTap: () => controller.toggleObscureText(),
                        child: controller.obscureText.value
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
                    );
                  }),
                  SizedBox(height: 32.h),
                  ElevatedButtonWidget(onTap: () {}, text: 'Login'),
                  SizedBox(height: 32.h),
                  InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Get.toNamed(AuthenticationRoutes.register);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Não tem uma conta? ',
                        children: [
                          TextSpan(
                            text: 'Cadastre-se',
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
