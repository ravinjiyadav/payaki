import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class ShortByListTile extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String title;
  final String value;
  final String selectedShortByValue;

  const ShortByListTile(
      {Key? key,
      required this.title,
      required this.value,
      required this.selectedShortByValue,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onChanged.call(value);
        },
        child: Container(
          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: StyleUtility.inputTextStyle,
              ),
              SizedBox(
                width: 30.sp,
                height: 30.sp,
                child: Radio(
                  splashRadius: 0,
                  activeColor: ColorUtility.color9C5FA3,
                  value: value,
                  groupValue: selectedShortByValue,
                  onChanged: (value) {
                    onChanged.call(value!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
