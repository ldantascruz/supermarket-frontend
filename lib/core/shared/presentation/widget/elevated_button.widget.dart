import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/_constants.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final double? width;
  final String? text;
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
    this.text,
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
          border: buttonColor == AppColors.primaryColor ||
                  buttonColor == AppColors.whiteColor
              ? Border.all(
                  color: borderColor ?? AppColors.primaryColor,
                  width: 1,
                )
              : null,
        ),
        width: width,
        height: AppSize.buttonHeight,
        alignment: Alignment.center,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text == null
                ? const SizedBox.shrink()
                :
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
              ),
              icon == null
                ? const SizedBox.shrink()
                : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Icon(
                      icon,
                      size: iconSize ?? 16.sp,
                      color: textColor ?? AppColors.whiteColor,
                    ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
