import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/auth/forgotPassword/viewModel/forgot_new_pass_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/auth/forgotPassword/generate_new_pass_request.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

class ForgotNewPasswordScreen extends StatefulWidget {
  final String userId;

  const ForgotNewPasswordScreen({Key? key, required this.userId})
      : super(key: key);

  @override
  State<ForgotNewPasswordScreen> createState() =>
      _ForgotNewPasswordScreenState();
}

class _ForgotNewPasswordScreenState extends State<ForgotNewPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Change Password",
      ),
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
                        height: 25.h,
                      ),
                      Text(
                        "Enter your New Password",
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      SimpleTextField(
                        controller: newPasswordController,
                        hintText: "New Password",
                        titleText: "New Password",
                        image: ImageUtility.passwordIcon,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: confirmPasswordController,
                        hintText: "Enter Confirm Password",
                        titleText: "Confirm Password",
                        image: ImageUtility.passwordIcon,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<ForgotNewPassVm>(
                  builder: (context, forgotNewPassVm, child) {
                return Container(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                        buttonText: "Done",
                        onTab: () {
                          if (newPasswordController.text.isEmpty) {
                            context.flushBarTopErrorMessage(
                                message: "Please Enter New Password");
                          } else if (confirmPasswordController.text.isEmpty) {
                            context.flushBarTopErrorMessage(
                                message: "Please Confirm Password");
                          } else if (newPasswordController.text !=
                              confirmPasswordController.text) {
                            context.flushBarTopErrorMessage(
                                message: "Confirm Password Not Matched.");
                          } else {
                            CommonDialog.showLoadingDialog(context);
                            forgotNewPassVm.generateNewPass(
                                onSuccess: (value) {
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(context,
                                      RouteName.forgotPassSuccessScreen);
                                },
                                onFailure: (value) {
                                  Navigator.pop(context);
                                  context.flushBarTopErrorMessage(message: value);
                                },
                                request: GenerateNewPassRequest(
                                    name: Endpoints.auth.generateNewPassword,
                                    param: Param(
                                        userId: widget.userId,
                                        password: newPasswordController.text)));
                          }
                        }));
              }),
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
