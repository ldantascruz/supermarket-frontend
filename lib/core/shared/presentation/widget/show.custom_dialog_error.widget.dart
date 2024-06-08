import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../config/constants/app.colors.dart';

void showCustomDialogError({BuildContext? context, required String title, required String content, required String buttonText}) {
  showDialog(
    context: context ?? Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.sp),
          side: BorderSide(color: AppColors.primaryColor, width: 10),
        ),
        title: Row(
          children: [
            Icon(
                Icons.cancel_outlined,
                color: AppColors.errorColor,
                size: 30
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: AppColors.errorColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(content, textAlign: TextAlign.center, style: TextStyle(color: AppColors.errorColor, fontSize: 14.sp)),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(buttonText, style: TextStyle(color: AppColors.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
          ),
        ],
      );
    },
  );
}