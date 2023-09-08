import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';

class UploadImageWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const UploadImageWidget({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: StyleUtility.inputTextStyle,
        ),
        DottedBorder(
            strokeWidth: 2,
            borderType: BorderType.RRect,
            color: ColorUtility.colorDEDEDE,
            radius: Radius.circular(10.r),
            padding: EdgeInsets.only(top: 24.sp, bottom: 24.sp),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageUtility.uploadImage,
                      width: 50.w,
                      height: 50.w,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Upload Images",
                      style: StyleUtility.axiforma500.copyWith(
                          fontSize: TextSizeUtility.textSize14,
                          color: ColorUtility.color8F8F8F),
                    ),
                  ],
                ),
              ),
            )),
        SizedBox(
          height: 2.h,
        ),
        Text(
          "Mandatory Only JPG, PNG, JPEG File Accepted",
          style: StyleUtility.axiforma400.copyWith(
              fontSize: TextSizeUtility.textSize12,
              color: ColorUtility.color8F8F8F),
        ),
      ],
    );
  }
}
