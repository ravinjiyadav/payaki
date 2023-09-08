import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';

class AddDetailScreen extends StatefulWidget {
  final int catId;
  final int subCatId;

  const AddDetailScreen({Key? key, required this.catId, required this.subCatId})
      : super(key: key);

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  TextEditingController tagController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Post Ad",
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
                      SizedBox(height: 23.h),
                      Text(
                        "Ads Details",
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(height: 25.h),
                      SimpleTextField(
                        controller: titleController,
                        hintText: "Title for your advertise",
                        titleText: "Title *",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: tagController,
                        hintText: "Enter the tags separated by commas.",
                        titleText: "Tag *",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: descriptionController,
                        hintText: "Tell us more about your advertise",
                        titleText: "Description *",
                        maxLine: 5,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                  buttonText: "Next",
                  onTab: () {
                    if (titleController.text.isEmpty) {
                      context.flushBarTopErrorMessage(message: 'Please Enter Title.');
                    } else if (tagController.text.isEmpty) {
                      context.flushBarTopErrorMessage(message: 'Please Enter Tag.');
                    } else if (descriptionController.text.isEmpty) {
                      context.flushBarTopErrorMessage(
                          message: 'Please Enter Description.');
                    } else {
                      Navigator.pushNamed(context, RouteName.setPriceScreen,
                          arguments: {
                            "catId": widget.catId,
                            "subCatId": widget.subCatId,
                            "title": titleController.text,
                            "tag": tagController.text,
                            "description": descriptionController.text,
                          });
                    }
                  }),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
