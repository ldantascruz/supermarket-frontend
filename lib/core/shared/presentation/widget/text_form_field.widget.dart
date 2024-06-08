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
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          height: height,
          alignment: Alignment.centerLeft,
          child: TextFormField(
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
            cursorHeight: AppSize.cursorHeight - 15,
            onEditingComplete: onEditingComplete,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: AppColors.whiteColor,
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSize.horizontalPadding,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.primaryColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: AppColors.errorColor,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: AppColors.errorColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: AppColors.primaryColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.blackColor,
                ),
              ),
              hintStyle: TextStyle(
                color: AppColors.primaryColor.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              errorStyle: TextStyle(
                color: AppColors.errorColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
