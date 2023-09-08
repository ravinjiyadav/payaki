import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.color844193,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  ImageUtility.pIcon,
                  width: 145.w,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Welcome!",
                      style: StyleUtility.headingTextStyle.copyWith(
                          color: ColorUtility.whiteColor,
                          fontSize: TextSizeUtility.textSize24),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam.",
                    style: StyleUtility.welcomeDetailTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RouteName.bottomNavigationBarScreen);
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 100.w,
                                height: 100.w,
                                color: ColorUtility.colorF5F6FA,
                                child: Center(
                                  child: Image.asset(
                                    ImageUtility.buyIcon,
                                    width: 45.w,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            Text(
                              "BUY",
                              style: StyleUtility.titleTextStyle.copyWith(
                                  fontSize: TextSizeUtility.textSize20,
                                  color: ColorUtility.whiteColor),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RouteName.logInScreen);
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 100.w,
                                height: 100.w,
                                color: ColorUtility.colorF5F6FA,
                                child: Center(
                                  child: Image.asset(
                                    ImageUtility.sellIcon,
                                    width: 45.w,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            Text(
                              "SELL",
                              style: StyleUtility.titleTextStyle.copyWith(
                                  fontSize: TextSizeUtility.textSize20,
                                  color: ColorUtility.whiteColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
