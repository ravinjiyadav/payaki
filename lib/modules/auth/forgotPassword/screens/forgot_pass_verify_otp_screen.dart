import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/auth/forgotPassword/viewModel/forgot_pass_verify_otp_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/auth/forgotPassword/forgot_pass_send_otp_request.dart'
    as send_otp_req;
import 'package:payaki/network/model/request/auth/forgotPassword/forgot_pass_verify_otp_request.dart';

import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/otp_text_field.dart';
import 'package:payaki/widgets/timer_widget.dart';
import 'package:provider/provider.dart';

class ForgotPassVerifyOtpScreen extends StatefulWidget {
  final String userId;
  final String countryCode;
  final String mobile;

  const ForgotPassVerifyOtpScreen(
      {Key? key,
      required this.userId,
      required this.countryCode,
      required this.mobile})
      : super(key: key);

  @override
  State<ForgotPassVerifyOtpScreen> createState() =>
      _ForgotPassVerifyOtpScreenState();
}

class _ForgotPassVerifyOtpScreenState extends State<ForgotPassVerifyOtpScreen> {
  TextEditingController otpController = TextEditingController();

  bool _isTimerRunning = true;

  int duration = 120;

  void _startTimer(ForgotPassVerifyOtpVm forgotPassVerifyOtpVm) {
    duration = 120;
    _isTimerRunning = true;
    forgotPassVerifyOtpVm.notifyListeners();
  }

  void _onTimerFinished(ForgotPassVerifyOtpVm forgotPassVerifyOtpVm) {
    _isTimerRunning = false;
    forgotPassVerifyOtpVm.notifyListeners();
  }

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
          child: Consumer<ForgotPassVerifyOtpVm>(
              builder: (context, forgotPassVerifyOtpVm, child) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Enter OTP",
                            style: StyleUtility.headingTextStyle,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text:
                                  'Please enter OTP which has been sent to your Phone Number',
                              style: StyleUtility.detailTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  style: StyleUtility.resendOtpTextStyle,
                                  text:
                                      ' "${widget.countryCode}${widget.mobile}"',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          OtpTextField(controller: otpController),
                          _isTimerRunning
                              ? TimerWidget(
                                  durationInSeconds: duration,
                                  onTimerFinished: () {
                                    _onTimerFinished(forgotPassVerifyOtpVm);
                                  },
                                )
                              : const Text(''),
                          SizedBox(
                            height: 20.h,
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: 'Didn’t received OTP ? ',
                              style: StyleUtility.detailTextStyle
                                  .copyWith(color: ColorUtility.colorAEB1B9),
                              children: <TextSpan>[
                                TextSpan(
                                    style: _isTimerRunning == false
                                        ? StyleUtility.resendOtpTextStyle
                                            .copyWith()
                                        : StyleUtility.detailTextStyle.copyWith(
                                            color: ColorUtility.colorAEB1B9),
                                    text: 'Resend OTP',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        if (_isTimerRunning == false) {
                                          CommonDialog.showLoadingDialog(
                                              context);
                                          forgotPassVerifyOtpVm
                                              .forgotPassSendOtp(
                                            request: send_otp_req
                                                .ForgotPassSendOtpRequest(
                                                    name: Endpoints.auth
                                                        .forgetPasswordSendOtp,
                                                    param: send_otp_req.Param(
                                                        mobile: widget.mobile,
                                                        countryCode: widget
                                                            .countryCode)),
                                            onSuccess: (value) {
                                              Navigator.pop(context);

                                              context.showToast(
                                                  message:
                                                      "${value.message} ${value.data!.otp}");
                                              _startTimer(
                                                  forgotPassVerifyOtpVm);
                                            },
                                            onFailure: (value) {
                                              Navigator.pop(context);
                                              context.flushBarTopErrorMessage(
                                                  message: value);
                                            },
                                          );
                                        }
                                      }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      )),
                ),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                        buttonText: "Verify OTP",
                        onTab: () {
                          if (otpController.text.isEmpty ||
                              otpController.text.length < 6) {
                            context.flushBarTopErrorMessage(
                                message: "Please Enter 6 Digit Otp");
                          } else {
                            CommonDialog.showLoadingDialog(context);
                            forgotPassVerifyOtpVm.verifyOtp(
                                request: ForgotPassVerifyOtpRequest(
                                    name:
                                        Endpoints.auth.forgetPasswordVerifyOtp,
                                    param: Param(
                                      userId: widget.userId,
                                      otp: otpController.text,
                                    )),
                                onSuccess: (value) {
                                  Navigator.pop(context);

                                  context.flushBarTopErrorMessage(
                                      message: value);
                                  Navigator.pushReplacementNamed(context,
                                      RouteName.forgotNewPasswordScreen,
                                      arguments: {"userId": widget.userId});
                                },
                                onFailure: (value) {
                                  Navigator.pop(context);
                                  context.flushBarTopErrorMessage(
                                      message: value);
                                });
                          }
                        })),
                SizedBox(
                  height: 35.h,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
