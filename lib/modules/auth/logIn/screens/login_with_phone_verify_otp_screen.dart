import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/auth/logIn/provider/login_with_phone_verify_otp_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/loginSignup/login_with_phone_send_otp_request.dart'
    as lr;
import 'package:payaki/network/model/request/loginSignup/login_with_phone_verify_otp_request.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/otp_text_field.dart';
import 'package:payaki/widgets/timer_widget.dart';
import 'package:provider/provider.dart';

class LoginWithPhoneVerifyOtpScreen extends StatefulWidget {
  final String countryCode;
  final String mobile;

  const LoginWithPhoneVerifyOtpScreen(
      {Key? key, required this.countryCode, required this.mobile})
      : super(key: key);

  @override
  State<LoginWithPhoneVerifyOtpScreen> createState() =>
      _LoginWithPhoneVerifyOtpScreenState();
}

class _LoginWithPhoneVerifyOtpScreenState
    extends State<LoginWithPhoneVerifyOtpScreen> {
  TextEditingController otpController = TextEditingController();

  bool _isTimerRunning = true;

  int duration = 120;

  void _startTimer(LoginWithPhoneVerifyOtpVm loginWithPhoneVerifyOtpVm) {
    duration = 120;
    _isTimerRunning = true;
    loginWithPhoneVerifyOtpVm.notifyListeners();
  }

  void _onTimerFinished(LoginWithPhoneVerifyOtpVm loginWithPhoneVerifyOtpVm) {
    _isTimerRunning = false;
    loginWithPhoneVerifyOtpVm.notifyListeners();
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
          child: Consumer<LoginWithPhoneVerifyOtpVm>(
              builder: (context, loginWithPhoneVerifyOtpVm, child) {
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
                                    _onTimerFinished(loginWithPhoneVerifyOtpVm);
                                  },
                                )
                              : Text(''),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     Text(
                          //       '01:50',
                          //       style: StyleUtility.resendOtpTextStyle.copyWith(
                          //           decoration: TextDecoration.underline),
                          //     ),
                          //     Text(
                          //       ' Sec Left',
                          //       style: StyleUtility.detailTextStyle,
                          //     ),
                          //   ],
                          // ),

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
                                          loginWithPhoneVerifyOtpVm.sendOtp(
                                            request:
                                                lr.LoginWithPhoneSendOtpRequest(
                                                    name: Endpoints
                                                        .auth.loginWithPhone,
                                                    param: lr.Param(
                                                        phone: widget.mobile,
                                                        countryCode: widget
                                                            .countryCode)),
                                            onSuccess: (value) {
                                              Navigator.pop(context);

                                              context.flushBarTopErrorMessage(
                                                  message:
                                                      "${value.message} ${value.data!.otp}");
                                              _startTimer(
                                                  loginWithPhoneVerifyOtpVm);
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
                            loginWithPhoneVerifyOtpVm.verifyOtp(
                                request: LoginWithPhoneVerifyOtpRequest(
                                    name: Endpoints.auth.verifyLoginOTP,
                                    param: Param(
                                      countryCode: widget.countryCode,
                                      phone: widget.mobile,
                                      otp: otpController.text,
                                    )),
                                onSuccess: (value) {
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(context,
                                      RouteName.bottomNavigationBarScreen);
                                },
                                onFailure: (value) {
                                  Navigator.pop(context);
                                  context.flushBarTopErrorMessage(message: value);
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
