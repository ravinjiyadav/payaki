import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textInputType,
    this.image,
    this.titleText,
    this.passwordVisible,
    this.onPrefixIconTap,
    this.maxLine,
    this.inputFormatter,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String? titleText;
  final String? image;
  final TextInputType? textInputType;
  final bool? passwordVisible;
  final int? maxLine;
  final List<TextInputFormatter>? inputFormatter;
  final VoidCallback? onPrefixIconTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null)
          Text(
            titleText ?? "",
            style: StyleUtility.inputTextStyle,
          ),
        Container(
          // height: 55.sp,
          child: TextFormField(
            obscureText: passwordVisible ?? false,
            controller: controller,
            textAlign: TextAlign.start,
            keyboardType: textInputType ?? TextInputType.text,
            maxLines: maxLine ?? 1,
            style: StyleUtility.inputTextStyle,
            textAlignVertical: TextAlignVertical.center,
            inputFormatters: inputFormatter,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 20.w, top: 16, bottom: 16, right: 5.w),
              filled: true,
              fillColor: ColorUtility.colorF8FAFB,
              hintStyle: StyleUtility.hintTextStyle,
              hintText: hintText,
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
              prefixIcon: image != null
                  ? SizedBox(
                      height: 55.sp,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
                        child: Image.asset(image!),
                      ),
                    )
                  : null,
              suffixIcon: onPrefixIconTap != null
                  ? SizedBox(
                      height: 55.sp,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
                        child: InkWell(
                          onTap: onPrefixIconTap,
                          child: Image.asset(passwordVisible == true
                              ? ImageUtility.eyeShowIcon
                              : ImageUtility.eyeHideIcon),
                        ),
                      ),
                    )
                  : null,
              focusColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
