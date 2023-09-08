import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/modules/profile/viewModel/profile_screen_vm.dart';
import 'package:payaki/modules/profile/widget/setting_tile_widget.dart';
import 'package:payaki/network/model/response/profile/user_profile_response.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenVm profileScreenVm = ProfileScreenVm();

  @override
  void initState() {
    super.initState();
    profileScreenVm = Provider.of(context, listen: false);
    profileScreenVm.getUserDetail(onFailure: (message) {
      context.flushBarTopErrorMessage(message: message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorF6F6F6,
      appBar: const CustomAppBar(title: "Profile", isShowBackButton: false),
      body: SafeArea(
        child: Consumer<ProfileScreenVm>(
            builder: (context, profileScreenVm, child) {
          var userProfile = profileScreenVm.userProfileResponse?.data;

          return profileScreenVm.isLoading == false
              ? SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      userProfile?.status == "0"
                          ? Container(
                              margin: EdgeInsets.only(top: 15.h),
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  top: 10.w,
                                  bottom: 18.w),
                              decoration: BoxDecoration(
                                color: ColorUtility.colorDACADD,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    ImageUtility.verifyEmailIcon,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.start,
                                          text: TextSpan(
                                            text: 'Welcome',
                                            style: StyleUtility.axiforma400
                                                .copyWith(
                                                    color: ColorUtility
                                                        .color001802,
                                                    fontSize: TextSizeUtility
                                                        .textSize14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    ' ${userProfile?.name ?? ""}, ',
                                                style: StyleUtility
                                                    .axiforma600
                                                    .copyWith(
                                                        color: ColorUtility
                                                            .color001802,
                                                        fontSize:
                                                            TextSizeUtility
                                                                .textSize14),
                                              ),
                                              TextSpan(
                                                text: "Go to your email",
                                                style: StyleUtility
                                                    .axiforma400
                                                    .copyWith(
                                                        color: ColorUtility
                                                            .color001802,
                                                        fontSize:
                                                            TextSizeUtility
                                                                .textSize14),
                                              ),
                                              TextSpan(
                                                //  text: " test@mail123.com ",
                                                text:
                                                    " ${userProfile?.email ?? ""} ",
                                                style: StyleUtility
                                                    .axiforma600
                                                    .copyWith(
                                                        color: ColorUtility
                                                            .color001802,
                                                        fontSize:
                                                            TextSizeUtility
                                                                .textSize14),
                                              ),
                                              TextSpan(
                                                text:
                                                    "verify your email address.",
                                                style: StyleUtility
                                                    .axiforma400
                                                    .copyWith(
                                                        color: ColorUtility
                                                            .color001802,
                                                        fontSize:
                                                            TextSizeUtility
                                                                .textSize14),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              CommonDialog.showLoadingDialog(
                                                  context);
                                              profileScreenVm.resendEmail(
                                                email: userProfile?.email,
                                                onSuccess: (message) {
                                                  Navigator.pop(context);
                                                  context.flushBarTopSuccessMessage(
                                                      message: message);
                                                },
                                                onFailure: (message) {
                                                  Navigator.pop(context);
                                                  context.flushBarTopErrorMessage(
                                                      message: message);
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Resend Email",
                                              style: StyleUtility.urlTextStyle
                                                  .copyWith(
                                                      fontSize:
                                                          TextSizeUtility
                                                              .textSize14),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(height: 15.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 25.w, right: 25.w, top: 20.w, bottom: 14.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          children: [
                            ClipOval(
                              child: userProfile?.image != null &&
                                      userProfile!.image != ""
                                  ? SizedBox(
                                      width: 90.w,
                                      height: 90.w,
                                      child: NetworkImageWidget(
                                          width: 25.w,
                                          height: 25.w,
                                          url: userProfile.image ?? ""),
                                    )
                                  : Image.asset(
                                      ImageUtility.userDummyIcon,
                                      width: 90.w,
                                      height: 90.w,
                                    ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              userProfile?.email ?? "",
                              style: StyleUtility.headingTextStyle.copyWith(
                                  fontSize: TextSizeUtility.textSize22),
                              textAlign: TextAlign.center,
                            ),
                            Text(userProfile?.name ?? "",
                                textAlign: TextAlign.center,
                                style: StyleUtility.titleTextStyle),
                            socialUrlView(userProfile),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 40.sp,
                              width: MediaQuery.of(context).size.width,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: ColorUtility.colorF8FAFB,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  side: const BorderSide(
                                      color: ColorUtility.colorE2E5EF,
                                      width: 2),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteName.editProfileScreen,
                                      arguments: {
                                        "userProfile": userProfile
                                      }).then((value) {
                                    if (value == true) {
                                      profileScreenVm.getUserDetail();
                                    }
                                  });
                                },
                                child: Text(
                                  "Edit Profile",
                                  maxLines: 1,
                                  style:
                                      StyleUtility.buttonTextStyle.copyWith(
                                    color: ColorUtility.color152D4A,
                                    fontSize: TextSizeUtility.textSize14,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 17.w, right: 10.w, top: 15.w, bottom: 33.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text("Information",
                                style: StyleUtility.headingTextStyle),
                            SizedBox(
                              height: 15.h,
                            ),
                            SettingTileWidget(
                              title: userProfile?.email ?? "",
                              image: ImageUtility.emailIcon,
                              imageWidth: 18.w,
                            ),
                            userProfile?.website != null &&
                                    userProfile!.website!.isNotEmpty
                                ? SettingTileWidget(
                                    title: userProfile.website ?? "",
                                    image: ImageUtility.webSiteUrlIcon,
                                    imageWidth: 18.w,
                                  )
                                : const SizedBox(),
                            userProfile?.address != null &&
                                    userProfile!.address!.isNotEmpty
                                ? SettingTileWidget(
                                    title: userProfile.address ?? "",
                                    image: ImageUtility.locationIcon,
                                    imageWidth: 16.w,
                                    onTap: () async {
                                      await googleSignIn.signOut();
                                      Preference().clearSharedPreference();
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          RouteName.logInScreen,
                                          (route) => false);
                                    },
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 17.w, right: 10.w, top: 15.w, bottom: 33.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text("Account Settings",
                                style: StyleUtility.headingTextStyle),
                            SizedBox(
                              height: 15.h,
                            ),
                            SettingTileWidget(
                              title: "Change Password",
                              image: ImageUtility.passwordIcon,
                              imageWidth: 14.w,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.changePasswordScreen);
                              },
                            ),
                            SettingTileWidget(
                              title: "Transaction",
                              image: ImageUtility.transactionIcon,
                              imageWidth: 14.w,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.transactionScreen);
                              },
                            ),

                            SettingTileWidget(
                              title: "My Cart",
                              image: ImageUtility.addToCartIcon,
                              imageWidth: 14.w,
                              onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.myCartScreen);
                                 },
                            ),
                            SettingTileWidget(
                              title: "Log Out",
                              image: ImageUtility.logOutIcon,
                              imageWidth: 12.w,
                              onTap: () async {
                                await googleSignIn.signOut();
                                Preference().clearSharedPreference();
                                Navigator.pushNamedAndRemoveUntil(context,
                                    RouteName.logInScreen, (route) => false);
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 60.h),
                    ],
                  ),
                ),
              )
              : const CircularProgressWidget();
        }),
      ),
    );
  }

  Widget socialUrlView(Data? userProfile) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          userProfile?.facebook != null && userProfile!.facebook!.isNotEmpty
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      _launchUrl(userProfile.facebook ?? "");
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 9.w, horizontal: 11.w),
                      child: Image.asset(
                        ImageUtility.faceBookIcon,
                        width: 20.w,
                        height: 20.w,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          userProfile?.googleplus != null && userProfile!.googleplus!.isNotEmpty
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      _launchUrl(userProfile.googleplus ?? "");
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 9.w, horizontal: 11.w),
                      child: Image.asset(
                        ImageUtility.pinterestIcon,
                        width: 20.w,
                        height: 20.w,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          userProfile?.twitter != null && userProfile!.twitter!.isNotEmpty
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      _launchUrl(userProfile.twitter ?? "");
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 9.w, horizontal: 11.w),
                      child: Image.asset(
                        ImageUtility.twitterIcon,
                        width: 20.w,
                        height: 17.w,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          userProfile?.instagram != null && userProfile!.instagram!.isNotEmpty
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      _launchUrl(userProfile.instagram ?? "");
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 9.w, horizontal: 11.w),
                      child: Image.asset(
                        ImageUtility.instagramIcon,
                        width: 20.w,
                        height: 20.w,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          userProfile?.youtube != null && userProfile!.youtube!.isNotEmpty
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      _launchUrl(userProfile.youtube ?? "");
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 9.w, horizontal: 11.w),
                      child: Image.asset(
                        ImageUtility.youTubeIcon,
                        width: 20.w,
                        height: 14.w,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          userProfile?.linkedin != null && userProfile!.linkedin!.isNotEmpty
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      _launchUrl(userProfile.linkedin ?? "");
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 9.w, horizontal: 11.w),
                      child: Image.asset(
                        ImageUtility.linkedinIcon,
                        width: 20.w,
                        height: 20.w,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
