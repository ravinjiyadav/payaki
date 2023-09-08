import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/profile/viewModel/edit_profile_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/userProfile/update_profile_request.dart';
import 'package:payaki/network/model/response/profile/user_profile_response.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/validators.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';
import 'package:payaki/network/model/response/profile/country_list_response.dart'
    as country;

class EditProfileScreen extends StatefulWidget {
  final Data userProfile;

  const EditProfileScreen({Key? key, required this.userProfile})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  TextEditingController facebookController = TextEditingController();
  TextEditingController pinterestController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController youtubeController = TextEditingController();
  TextEditingController websiteURLController = TextEditingController();
  XFile? image;

  EditProfileScreenVm editProfileScreenVm = EditProfileScreenVm();

  country.Data? selectedCountry;

  @override
  void initState() {
    super.initState();
    setAutoFillData();

    editProfileScreenVm = Provider.of(context, listen: false);
    editProfileScreenVm.getCountryList(onFailure: (message) {
      context.flushBarTopErrorMessage(message: message);
    }, onSuccess: (m) {
      //  selectedCountry = country.Data(asciiname: "Andorra");

      //   selectedCountry = editProfileScreenVm.countryList?[0];

      selectedCountry = editProfileScreenVm.countryList?.firstWhere(
          (country) => country.asciiname == widget.userProfile.country);

      //   selectedCountry = country.Data(asciiname: widget.userProfile.country);
    });
  }

  void setAutoFillData() {
    nameController.text = widget.userProfile.name ?? "";
    addressController.text = widget.userProfile.address ?? "";
    aboutMeController.text = widget.userProfile.description ?? "";
    facebookController.text = widget.userProfile.facebook ?? "";
    pinterestController.text = widget.userProfile.googleplus ?? "";
    twitterController.text = widget.userProfile.twitter ?? "";
    instagramController.text = widget.userProfile.instagram ?? "";
    linkedinController.text = widget.userProfile.linkedin ?? "";
    youtubeController.text = widget.userProfile.youtube ?? "";
    websiteURLController.text = widget.userProfile.website ?? "";
  }

  Future selectImageFromGallery() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Edit Profile",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Stack(
                  children: [
                    ClipOval(
                      child: image != null
                          ? Image.file(
                              File(image!.path),
                              width: 90.w,
                              height: 90.w,
                              fit: BoxFit.cover,
                            )
                          : widget.userProfile.image != null &&
                                  widget.userProfile.image != ""
                              ? SizedBox(
                                  width: 90.w,
                                  height: 90.w,
                                  child: NetworkImageWidget(
                                      width: 25.w,
                                      height: 25.w,
                                      url: widget.userProfile.image ?? ""),
                                )
                              : Image.asset(
                                  ImageUtility.userDummyIcon,
                                  width: 90.w,
                                  height: 90.w,
                                ),
                    ),
                    Container(
                      width: 90.w,
                      height: 90.w,
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          selectImageFromGallery();
                        },
                        child: Image.asset(
                          ImageUtility.editIcon,
                          width: 26.w,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 35.h),
                SimpleTextField(
                  controller: nameController,
                  hintText: "Enter Your Name",
                  titleText: "Name *",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: addressController,
                  hintText: "Enter Your Address",
                  titleText: "Address",
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Country",
                    style: StyleUtility.inputTextStyle,
                    textAlign: TextAlign.start,
                  ),
                ),
                Consumer<EditProfileScreenVm>(
                    builder: (context, editProfileScreenVm, child) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<country.Data>(
                      isExpanded: false,

                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: 15.sp, bottom: 15.sp, left: 20.w, right: 5.w),
                        filled: true,
                        fillColor: ColorUtility.colorF8FAFB,
                        hintStyle: StyleUtility.hintTextStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: ColorUtility.colorE2E5EF,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: ColorUtility.colorE2E5EF,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: ColorUtility.colorE2E5EF,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: ColorUtility.colorE2E5EF,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: ColorUtility.colorE2E5EF,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: ColorUtility.colorE2E5EF,
                          ),
                        ),
                        focusColor: ColorUtility.whiteColor,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                      hint: Text(
                        "Select Country",
                        style: StyleUtility.hintTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      items: editProfileScreenVm.countryList
                          ?.map((item) => DropdownMenuItem<country.Data>(
                                value: item,
                                child: Text(
                                  item.asciiname!,
                                  style: StyleUtility.inputTextStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedCountry,
                      onChanged: (value) {
                        selectedCountry = value;
                        //  searchScreenVm.notifyListeners();
                      },
                      icon: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Image.asset(
                          ImageUtility.dropDownIcon,
                          width: 14.w,
                        ),
                      ),

                      //  offset: const Offset(-20, 0),
                    ),
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: aboutMeController,
                  hintText: "About Me",
                  titleText: "About Me",
                  maxLine: 5,
                ),
                // SizedBox(
                //   height: 15.h,
                // ),
                // HtmlEditor(
                //   controller: controller,
                //   //required
                //   htmlToolbarOptions:
                //       const HtmlToolbarOptions(defaultToolbarButtons: [
                //     //  StyleButtons(),
                //     //  FontSettingButtons(fontSizeUnit: true),
                //     FontButtons(
                //         clearAll: false,
                //         strikethrough: false,
                //         subscript: false,
                //         superscript: false),
                //     ColorButtons(highlightColor: false),
                //     ListButtons(listStyles: false),
                //     ParagraphButtons(
                //       textDirection: false,
                //       lineHeight: false,
                //       caseConverter: false,
                //       alignRight: false,
                //       alignCenter: false,
                //       alignJustify: false,
                //       increaseIndent: false,
                //       decreaseIndent: false,
                //     ),
                //
                //     InsertButtons(
                //         video: false,
                //         audio: false,
                //         table: false,
                //         hr: false,
                //         picture: false,
                //         otherFile: false),
                //   ]),
                //   htmlEditorOptions: HtmlEditorOptions(
                //       hint: "About Me",
                //       initialText: widget.userProfile.description
                //       ),
                //   otherOptions: OtherOptions(
                //     height: 200.sp,
                //   ),
                // ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: facebookController,
                  hintText: "Enter Facebook Profile Link",
                  titleText: "Facebook",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: pinterestController,
                  hintText: "Enter Pinterest Profile Link",
                  titleText: "Pinterest",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: twitterController,
                  hintText: "Enter Twitter Profile Link",
                  titleText: "Twitter",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: instagramController,
                  hintText: "Enter Instagram Profile Link",
                  titleText: "Instagram",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: linkedinController,
                  hintText: "Enter Linkedin Profile Link",
                  titleText: "Linkedin",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: youtubeController,
                  hintText: "Enter Youtube Profile Link",
                  titleText: "Youtube",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: websiteURLController,
                  hintText: "Enter Website URL",
                  titleText: "Website URL",
                ),
                SizedBox(
                  height: 54.h,
                ),
                Consumer<EditProfileScreenVm>(
                    builder: (context, editProfileScreenVm, child) {
                  return CustomButton(
                      buttonText: "Update",
                      onTab: () async {
                        if (nameController.text.isEmpty) {
                          context.flushBarTopErrorMessage(message: 'Please Enter Title.');
                        } else if (facebookController.text.isNotEmpty &&
                            Validators.checkValidateUrl(
                                    facebookController.text) ==
                                false) {
                          context.flushBarTopErrorMessage(
                              message: "Please Enter Valid Facebook Link.");
                        } else if (pinterestController.text.isNotEmpty &&
                            Validators.checkValidateUrl(
                                    pinterestController.text) ==
                                false) {
                          context.flushBarTopErrorMessage(
                              message:
                                  "Please Enter Valid Pinterest Profile Link.");
                        } else if (twitterController.text.isNotEmpty &&
                            Validators.checkValidateUrl(
                                    twitterController.text) ==
                                false) {
                          context.flushBarTopErrorMessage(
                              message:
                                  "Please Enter Valid Twitter Profile Link.");
                        } else if (instagramController.text.isNotEmpty &&
                            Validators.checkValidateUrl(
                                    instagramController.text) ==
                                false) {
                          context.flushBarTopErrorMessage(
                              message: "Please Enter Valid Instagram Link.");
                        } else if (linkedinController.text.isNotEmpty &&
                            Validators.checkValidateUrl(
                                    linkedinController.text) ==
                                false) {
                          context.flushBarTopErrorMessage(
                              message:
                                  "Please Enter Valid Linkedin Profile Link.");
                        } else if (youtubeController.text.isNotEmpty &&
                            Validators.checkValidateUrl(
                                    youtubeController.text) ==
                                false) {
                          context.flushBarTopErrorMessage(
                              message: "Please Enter Valid Youtube Link.");
                        } else if (websiteURLController.text.isNotEmpty &&
                            Validators.checkValidateUrl(
                                    websiteURLController.text) ==
                                false) {
                          context.flushBarTopErrorMessage(
                              message: "Please Enter Valid Website URL.");
                        } else {
                          CommonDialog.showLoadingDialog(context);
                          editProfileScreenVm.updateProfile(
                              request: UpdateProfileRequest(
                                name: Endpoints
                                    .userProfileEndPoints.updateProfile,
                                username: nameController.text,
                                address: addressController.text,
                                country: selectedCountry?.asciiname,
                                description: aboutMeController.text,
                                website: websiteURLController.text,
                                facebook: facebookController.text,
                                twitter: twitterController.text,
                                googleplus: pinterestController.text,
                                instagram: instagramController.text,
                                linkedin: linkedinController.text,
                                youtube: youtubeController.text,
                              ),
                              photo: image,
                              onSuccess: (message) {
                                Navigator.pop(context);
                                Navigator.pop(context, true);
                                context.flushBarTopSuccessMessage(message: message);
                              },
                              onFailure: (message) {
                                Navigator.pop(context);
                                context.flushBarTopErrorMessage(message: message);
                              });
                        }
                      });
                }),
                SizedBox(
                  height: 47.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
