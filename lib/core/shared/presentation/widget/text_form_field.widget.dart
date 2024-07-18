import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/app.colors.dart';
import '../../../config/constants/app.fonts.dart';
import '../../../config/constants/app.size.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final Function(String)? validator;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final bool enabled;
  final int maxLines;
  final double? height;
  final Color? backgroundColor;


  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.obscureText,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.textInputAction,
    this.suffixIcon,
    this.inputFormatters,
    this.textCapitalization,
    this.enabled = true,
    this.maxLines = 1,
    this.height,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primaryColor, width: 1.5),
          ),
          child: TextFormField(
            selectionHeightStyle: BoxHeightStyle.tight,
            maxLines: maxLines,
            minLines: 1,
            enabled: enabled,
            onChanged: onChanged,
            controller: controller,
            inputFormatters: inputFormatters,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType ?? TextInputType.emailAddress,
            validator: (value) => validator!(value!),
            textInputAction: textInputAction ?? TextInputAction.next,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            cursorColor: AppColors.primaryColor,
            cursorHeight: AppSize.cursorHeight - 15.h,
            onEditingComplete: onEditingComplete,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: backgroundColor,
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(horizontal: AppSize.horizontalPadding, vertical: height ?? 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(width: 0.5.sp, color: AppColors.secondaryColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: const BorderSide(width: 1.5, color: AppColors.errorColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: const BorderSide(width: 1.5, color: AppColors.errorColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: const BorderSide(width: 1.5, color: AppColors.primaryColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: const BorderSide(width: 0.5, color: AppColors.primaryColor),
              ),
              hintStyle: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 12.sp,
                fontFamily: AppFonts.poppins,
                fontWeight: FontWeight.w400,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 12.sp,
              fontFamily: AppFonts.poppins,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
