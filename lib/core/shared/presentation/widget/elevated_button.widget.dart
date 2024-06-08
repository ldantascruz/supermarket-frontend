import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/app.colors.dart';
import '../../../config/constants/app.fonts.dart';
import '../../../config/constants/app.size.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final double? width;
  final String text;
  final Color? buttonColor;
  final Color? borderColor;
  final Function() onTap;
  final bool? enableFeedback;
  final IconData? icon;
  final double? iconSize;
  final Color? textColor;

  const ElevatedButtonWidget({
    super.key,
    this.width,
    required this.text,
    this.buttonColor,
    this.borderColor,
    required this.onTap,
    this.enableFeedback,
    this.icon,
    this.iconSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      enableFeedback: enableFeedback,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: buttonColor ?? AppColors.primaryColor,
          border: buttonColor == AppColors.backgroundColor ||
                  buttonColor == AppColors.whiteColor
              ? Border.all(
                  color: borderColor ?? AppColors.primaryColor,
                  width: 2,
                )
              : null,
        ),
        width: width,
        height: AppSize.buttonHeight,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? AppColors.whiteColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                icon,
                size: iconSize ?? 16.sp,
                color: textColor ?? AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
