import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';

class PremiumWidget extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String month;
  final ValueChanged onSelect;
  final bool checkBoxValue;

  const PremiumWidget({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.month,
    required this.onSelect,
    required this.checkBoxValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      padding:
      EdgeInsets.only(left: 12.w, right: 12.w, top: 22.h, bottom: 36.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorUtility.colorD9E7F8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20.sp,
            height: 20.sp,
            child: Checkbox(
              checkColor: ColorUtility.color9C5FA3,
              activeColor: ColorUtility.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                    width: 2.0, color: ColorUtility.color9C5FA3),
              ),
              value: checkBoxValue,
              onChanged: (bool? value) {
                onSelect.call(value);
              },
            ),
          ),
          Text(
            title,
            style: StyleUtility.headerTextStyle
                .copyWith(fontSize: TextSizeUtility.textSize18),
          ),
          SizedBox(
            height: 13.h,
          ),
          Text(
            description,
            style: StyleUtility.axiforma400.copyWith(
                fontSize: TextSizeUtility.textSize14,
                color: ColorUtility.color43576F),
          ),
          SizedBox(
            height: 29.h,
          ),
          Text(
            "\$$price",
            style: StyleUtility.headerTextStyle.copyWith(
                fontSize: TextSizeUtility.textSize24,
                color: ColorUtility.color1F1F1F),
          ),
          Text(
            "$month",
            style: StyleUtility.axiforma400.copyWith(
                fontSize: TextSizeUtility.textSize10,
                color: ColorUtility.color1F1F1F),
          ),
        ],
      ),
    );
  }
}
