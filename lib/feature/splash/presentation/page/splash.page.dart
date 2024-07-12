import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:supermarket_flutter/core/config/constants/app.colors.dart';

import '../../../../i18n/resources.dart';
import '../controller/splash.controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.find<SplashController>();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) => SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 10.0),
                  end: Offset.zero,
                ).animate(controller.logoAnimation),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/icon_transparent_2.png',
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            FadeTransition(
              opacity: controller.textAnimation,
              child: Text(
                R.strings.mySupermarket,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
