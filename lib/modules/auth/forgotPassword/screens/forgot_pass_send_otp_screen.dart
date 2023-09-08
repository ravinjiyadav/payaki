import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/auth/forgotPassword/viewModel/forgot_pass_send_opt_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/auth/forgotPassword/forgot_pass_send_otp_request.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';
import 'package:provider/provider.dart';

class ForgotPassSendOtpScreen extends StatefulWidget {
  const ForgotPassSendOtpScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassSendOtpScreen> createState() =>
      _ForgotPassSendOtpScreenState();
}

class _ForgotPassSendOtpScreenState extends State<ForgotPassSendOtpScreen> {
  TextEditingController mobileController = TextEditingController();

  String? countryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Forgot  Password",
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
                      child: Consumer<ForgotPassSendOtpVm>(
                          builder: (context, forgotPassSendOtpVm, child) {
                        return CustomButton(
                            buttonText: "Send OTP",
                            onTab: () {
                              if (mobileController.text.isEmpty) {
                                context.flushBarTopErrorMessage(
                                    message: "Please Enter Mobile Number");
                              } else {
                                CommonDialog.showLoadingDialog(context);
                                forgotPassSendOtpVm.forgotPassSendOtp(
                                  request: ForgotPassSendOtpRequest(
                                      name:
                                          Endpoints.auth.forgetPasswordSendOtp,
                                      param: Param(
                                          mobile: mobileController.text,
                                          countryCode: countryCode)),
                                  onSuccess: (value) {
                                    Navigator.pop(context);

                                    Navigator.pushNamed(context,
                                        RouteName.forgotPassVerifyOtpScreen,
                                        arguments: {
                                          "userId": value.data!.userId,
                                          "countryCode": countryCode,
                                          "mobile": mobileController.text
                                        });
                                    context.showToast(
                                        message:
                                            "${value.message} ${value.data!.otp}");
                                  },
                                  onFailure: (value) {
                                    Navigator.pop(context);
                                    context.flushBarTopErrorMessage(
                                        message: value);
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
