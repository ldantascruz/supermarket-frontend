import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../i18n/_i18n.dart';
import '../../../config/constants/app.colors.dart';

void showDialogErrorWidget({required BuildContext context, required String title, required String content}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.sp),
          side: const BorderSide(color: AppColors.primaryColor, width: 10),
        ),
        title: Row(
          children: [
            Icon(Icons.error_outline_outlined, color: AppColors.errorColor, size: 60.sp),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: AppColors.errorColor,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(content, textAlign: TextAlign.center, style: TextStyle(color: AppColors.secondaryColor, fontSize: 20.sp)),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp), color: AppColors.secondaryColor),
              padding: EdgeInsets.all(10.sp),
              child: Text(R.strings.ok, style: TextStyle(color: AppColors.primaryColor, fontSize: 20.sp, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      );
    },
  );
}