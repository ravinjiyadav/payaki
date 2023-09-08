import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/modules/auth/logIn/screens/log_in_screen.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class ForgotPassSuccessScreen extends StatefulWidget {
  const ForgotPassSuccessScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassSuccessScreen> createState() =>
      _ForgotPassSuccessScreenState();
}

class _ForgotPassSuccessScreenState extends State<ForgotPassSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 15.w, right: 15.w, top: 70.h),
                      child: Image.asset(ImageUtility.successBoardImage),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Text(
                      "Password has been\nchange successfully",
                      style: StyleUtility.axiforma700.copyWith(
                          fontSize: TextSizeUtility.textSize28,
                          color: ColorUtility.color152D4A),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Your Password has been\nchange successfully",
                      style: StyleUtility.axiforma400.copyWith(
                          fontSize: TextSizeUtility.textSize18,
                          color: ColorUtility.color8B97A4),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                      buttonText: "Back to Log In",
                      onTab: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteName.logInScreen, (route) => false);
                      })),
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
