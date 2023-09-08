import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/modules/postAdd/screens/select_add_type_screen.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';
import 'package:payaki/widgets/simple_text_field.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorUtility.whiteColor,
          title: Text(
            "Post Ad",
            style: StyleUtility.headerTextStyle,
          ),
          centerTitle: true,
          elevation: 1,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          shadowColor: ColorUtility.colorE2E5EF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 23.h,
                      ),
                      Text(
                        "User Details",
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SimpleTextField(
                        controller: fullNameController,
                        hintText: "Enter Full Name",
                        titleText: "Full Name *",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: emailController,
                        hintText: "Enter Email",
                        titleText: "Email *",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      MobileNumberTextField(
                        controller: mobileController,
                        onChanged: (phone) {
                          print(phone.number);
                          print(phone.countryCode);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                      buttonText: "Next",
                      onTab: () {

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
