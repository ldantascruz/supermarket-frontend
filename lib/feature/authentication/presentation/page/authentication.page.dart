import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/config/constants/_constants.dart';
import '../../../../core/shared/presentation/widget/_widget.dart';
import '../../../../core/util/validator/_validator.dart';
import '../../../../i18n/_i18n.dart';
import '../../authentication.routes.dart';
import '../controller/authentication.controller.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() =>
                      SizedBox(
                          height: controller.isRegisterObs.value ? 64.h : 128
                              .h)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32.r),
                    child: Image.asset(AppAssets.logo, width: 100.w),
                  ),
                  SizedBox(height: 42.h),
                  Obx(() {
                    return Text(
                      controller.isRegisterObs.value
                          ? R.strings.register
                          : R.strings.login,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    );
                  }),
                  SizedBox(height: 42.h),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormFieldWidget(
                          labelText: R.strings.email,
                          hintText: R.strings.emailHint,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.none,
                          controller: controller.emailController,
                          validator: (email) =>
                              EmailValidator().validate(email: email),
                        ),
                        SizedBox(height: 16.h),
                        Obx(() =>
                            TextFormFieldWidget(
                              labelText: R.strings.password,
                              hintText: controller.isRegisterObs.value
                                  ? R.strings.createPasswordHint
                                  : R.strings.passwordHint,
                              controller: controller.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.none,
                              obscureText: controller.isObscureTextPassword
                                  .value,
                              suffixIcon: InkWell(
                                onTap: () =>
                                    controller.toggleObscureText(
                                        controller: controller
                                            .passwordController),
                                child: controller.isObscureTextPassword.value
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
                              validator: (password) =>
                                  PasswordValidator().validate(
                                      password: password),
                            )),
                        Obx(() =>
                            Visibility(
                              visible: controller.isRegisterObs.value,
                              child: Column(
                                children: [
                                  SizedBox(height: 16.h),
                                  TextFormFieldWidget(
                                    labelText: R.strings.passwordConfirmation,
                                    hintText: R.strings
                                        .passwordConfirmationHint,
                                    controller: controller
                                        .confirmPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: controller
                                        .isObscureTextConfirmPassword.value,
                                    suffixIcon: InkWell(
                                      onTap: () =>
                                          controller.toggleObscureText(
                                              controller: controller
                                                  .confirmPasswordController),
                                      child: Icon(
                                        controller.isObscureTextConfirmPassword
                                            .value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 24.sp,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    validator: (confirmPassword) =>
                                        ConfirmPasswordValidator().validate(
                                          password: controller
                                              .passwordController
                                              .text,
                                          confirmPassword: confirmPassword,
                                        ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Obx(() => ElevatedButtonWidget(
                      text: controller.isRegisterObs.value
                          ? R.strings.register
                          : R.strings.login,
                      onTap: () async =>
                      await controller.authenticate(context: context),
                    )),
                  SizedBox(height: 32.h),
                  InkWell(
                    onTap: () {
                      controller.isRegisterObs.value =
                      !controller.isRegisterObs.value;
                      controller.formKey.currentState!.reset();
                    },
                    child: Text.rich(
                      TextSpan(
                        text: '${controller.isRegisterObs.value
                            ? R.strings.alreadyHaveAnAccount
                            : R.strings.doNotHaveAnAccount
                        } ',
                        children: [
                          TextSpan(
                            text: controller.isRegisterObs.value
                                ? R.strings.doLogin
                                : R.strings.registerNow,
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
