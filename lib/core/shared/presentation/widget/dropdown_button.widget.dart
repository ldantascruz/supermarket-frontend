import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../i18n/resources.dart';
import '../../../config/constants/app.colors.dart';
import '../../../config/constants/app.fonts.dart';
import '../../../config/constants/app.size.dart';

class DropdownButtonWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<String> items;
  final String? selectedItem;
  final Function(String?) onSelected;

  const DropdownButtonWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.items,
    this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

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

          ),
        ),
        SizedBox(height: 5.h),
        Container(
          height: AppSize.textFieldHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.blackColor, width: 0.5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                hintText,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12.sp,
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.w400,
                ),
              ),
              items: items
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 12.sp,
                            fontFamily: AppFonts.poppins,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedItem,
              onChanged: onSelected,
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 200,
                width: 200,
              ),
              dropdownStyleData: const DropdownStyleData(maxHeight: 300),
              menuItemStyleData: const MenuItemStyleData(height: 40),
              dropdownSearchData: DropdownSearchData(
                searchController: searchController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: searchController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: '${R.strings.search}...',
                      hintStyle: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 12.sp,
                        fontFamily: AppFonts.poppins,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  final result = item.value
                      .toString()
                      .toLowerCase()
                      .contains(searchValue.toLowerCase());
                  return result;
                },
              ),
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  searchController.clear();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
