import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/integration/firebase_integration.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/auth/logIn/provider/log_in_with_phone_send_otp_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/loginSignup/login_with_phone_send_otp_request.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';
import 'package:provider/provider.dart';

class LoginWithPhoneSendOtpScreen extends StatefulWidget {
  const LoginWithPhoneSendOtpScreen({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneSendOtpScreen> createState() =>
      _LoginWithPhoneSendOtpScreenState();
}

class _LoginWithPhoneSendOtpScreenState
    extends State<LoginWithPhoneSendOtpScreen> {
  TextEditingController mobileController = TextEditingController();

  String? countryCode;
  String? deviceToken;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    deviceToken = await FirebaseIntegration().getFirebaseToken();
    logD("Token $deviceToken");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Log In with Phone",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Enter your Mobile Number",
                style: StyleUtility.headingTextStyle,
              ),
              SizedBox(
                height: 25.h,
              ),
              MobileNumberTextField(
                controller: mobileController,
                onChanged: (phone) {
                  countryCode = phone.countryCode;
                  logD(phone.number);
                  logD(phone.countryCode);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Consumer<LoginWithPhoneSendOtpVm>(
                          builder: (context, loginWithPhoneSendOtpVm, child) {
                        return CustomButton(
                            buttonText: "Send OTP",
                            onTab: () {
                              if (mobileController.text.isEmpty) {
                                context.flushBarTopErrorMessage(
                                    message: "Please Enter Mobile Number");
                              } else {
                                CommonDialog.showLoadingDialog(context);
                                loginWithPhoneSendOtpVm.sendOtp(
                                  request: LoginWithPhoneSendOtpRequest(
                                      name: Endpoints.auth.loginWithPhone,
                                      param: Param(
                                          phone: mobileController.text,
                                          countryCode: countryCode,
                                          deviceType: Platform.isAndroid
                                              ? Constant.android
                                              : Constant.ios,
                                          deviceToken: deviceToken)),
                                  onSuccess: (value) {
                                    Navigator.pop(context);
                                    context.flushBarTopErrorMessage(
                                        message:
                                            "${value.message} ${value.data!.otp}");
                                    Navigator.pushNamed(context,
                                        RouteName.loginWithPhoneVerifyOtpScreen,
                                        arguments: {
                                          "countryCode": countryCode,
                                          "mobile": mobileController.text,
                                        });
                                  },
                                  onFailure: (value) {
                                    Navigator.pop(context);
                                    context.flushBarTopErrorMessage(message: value);
                                  },
                                );
                              }
                            });
                      }))),
              SizedBox(
                height: 35.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
