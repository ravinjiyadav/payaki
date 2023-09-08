import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (Preference().getUserLogin() == false) {
        Navigator.pushReplacementNamed(context, RouteName.welcomeScreen);
      } else {
        Navigator.pushReplacementNamed(
            context, RouteName.bottomNavigationBarScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.color844193,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Image.asset(
            ImageUtility.splashOnboardIcon,
            //  width: 70.w,
            height: 60.sp,
          ),
        ),
      ),
    );
  }
}
