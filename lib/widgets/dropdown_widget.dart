import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class DropDownWidget extends StatelessWidget {
  final String titleText;
  final String hintText;
  final List<String> itemList;
  final String? selectedValue;
  final ValueChanged<String> onValueChange;

  const DropDownWidget(
      {Key? key,
      required this.titleText,
      required this.itemList,
      required this.selectedValue,
      required this.onValueChange,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: StyleUtility.inputTextStyle,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  top: 15.sp, bottom: 15.sp, left: 20.w, right: 5.w),
              filled: true,
              fillColor: ColorUtility.colorF8FAFB,
              hintStyle: StyleUtility.hintTextStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              focusColor: ColorUtility.whiteColor,
            ),
            borderRadius: BorderRadius.circular(10.r),
            hint: Text(
              hintText,
              style: StyleUtility.hintTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
            items: itemList
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: StyleUtility.inputTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              onValueChange.call(value!);
            },
            icon: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Image.asset(
                ImageUtility.dropDownIcon,
                width: 14.w,
              ),
            ),

            //  offset: const Offset(-20, 0),
          ),
        ),
      ],
    );
  }
}
