import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpTextField extends StatelessWidget {
  final TextEditingController controller;

  const OtpTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10.r),
        borderWidth: 1,
        fieldHeight: 55.sp,
        fieldWidth: 55.sp,
        activeColor: ColorUtility.colorE2E5EF,
        selectedColor: ColorUtility.colorE2E5EF,
        inactiveColor: ColorUtility.colorE2E5EF,
        disabledColor: ColorUtility.colorE2E5EF,
        selectedFillColor: ColorUtility.colorE2E5EF,
        activeFillColor: ColorUtility.colorE2E5EF,
        inactiveFillColor: ColorUtility.colorE2E5EF,
        errorBorderColor: ColorUtility.colorE2E5EF,
      ),
      keyboardType: TextInputType.number,
      appContext: context,
      length: 6,
      textStyle: StyleUtility.inputTextStyle,
      onChanged: (String value) {},
    );
  }
}
