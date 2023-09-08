import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/auth/changePassword/viewModel/change_password_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/auth/changePassword/change_password_request.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
                        "Enter Your New Password",
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
              Consumer<ChangePasswordScreenVm>(
                  builder: (context, changePasswordScreenVm, child) {
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
                                message: "Please Enter Confirm Password");
                          } else if (newPasswordController.text !=
                              confirmPasswordController.text) {
                            context.flushBarTopErrorMessage(
                                message: "Confirm Password Not Matched.");
                          } else {
                            CommonDialog.showLoadingDialog(context);
                            changePasswordScreenVm.changePassword(
                                onSuccess: (message) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  context.flushBarTopSuccessMessage(
                                      message: message);
                                },
                                onFailure: (message) {
                                  Navigator.pop(context);
                                  context.flushBarTopErrorMessage(
                                      message: message);
                                },
                                request: ChangePasswordRequest(
                                    name: Endpoints.auth.changePassword,
                                    param: Param(
                                        newPassword: newPasswordController.text,
                                        confirmPassword:
                                            confirmPasswordController.text)));
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
