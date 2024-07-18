import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../config/constants/app.colors.dart';

void showDialogSuccessWidget({required BuildContext context, required String title, required String content, required String route}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.sp),
          side: const BorderSide(color: AppColors.primaryColor, width: 10),
        ),
        title: Row(
          children: [
            const Icon(Icons.check_circle, color: AppColors.primaryColor, size: 30),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(content, textAlign: TextAlign.center, style: TextStyle(color: AppColors.primaryColor, fontSize: 14.sp)),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed(route);
            },
            child: Text('OK', style: TextStyle(color: AppColors.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
          ),
        ],
      );
    },
  );
}