import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class MobileNumberTextField extends StatelessWidget {
  const MobileNumberTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;

  final ValueChanged<PhoneNumber> onChanged;

  @override
  Widget build(BuildContext context) {
    PhoneNumber? phoneNumber;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number*",
          style: StyleUtility.inputTextStyle,
        ),
        IntlPhoneField(
            textAlignVertical: TextAlignVertical.center,
            controller: controller,
            textAlign: TextAlign.left,
            style: StyleUtility.inputTextStyle,
            dropdownIconPosition: IconPosition.trailing,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.only(top: 12.sp, bottom: 12.sp, left: 10.sp, right: 10.sp),
              contentPadding: EdgeInsets.only(
                  top: 16, bottom: 16, left: 10.sp, right: 10.sp),
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
              filled: true,
              fillColor: ColorUtility.colorF8FAFB,
              hintStyle: StyleUtility.hintTextStyle,
              hintText: "Mobile Number",
            ),
            initialCountryCode: 'AO',
            onChanged: (phone) {
              onChanged.call(phone);
              phoneNumber = phone;
              logD("Phone $phone");
            },
            onCountryChanged: (country) {
              controller.clear();
            },
            dropdownIcon: const Icon(Icons.arrow_drop_down,
                color: ColorUtility.color5B5B5B)),
      ],
    );
  }
}
