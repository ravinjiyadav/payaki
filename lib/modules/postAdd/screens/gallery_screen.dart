import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/upload_image_widget.dart';

class GalleryScreen extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String title;
  final String tag;
  final String description;
  final String price;
  final int negotiate;

  const GalleryScreen(
      {Key? key,
      required this.catId,
      required this.subCatId,
      required this.title,
      required this.tag,
      required this.description,
      required this.price,
      required this.negotiate})
      : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<XFile> selectedImages = []; // List of selected image
  final picker = ImagePicker();

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage();
    if (pickedFile.isNotEmpty) {
      selectedImages.addAll(pickedFile);
      setState(() {});
    } else {}
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 23.h),
              Text(
                "Gallery",
                style: StyleUtility.headingTextStyle,
              ),
              SizedBox(height: 25.h),
              UploadImageWidget(
                  onTap: () {
                    getImages();
                  },
                  title: "Attach File"),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.w,
                  ),
                  itemCount: selectedImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: Image.file(
                            File(selectedImages[index].path),
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedImages.removeAt(index);
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.all(3.sp),
                            child: Image.asset(
                              ImageUtility.removeImage,
                              width: 15.w,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  buttonText: "Next",
                  onTab: () {
                    if (selectedImages.isEmpty) {
                      context.flushBarTopErrorMessage(message: "Please Upload Images.");
                    } else {
                      Navigator.pushNamed(context, RouteName.addLocationScreen,
                          arguments: {
                            "catId": widget.catId,
                            "subCatId": widget.subCatId,
                            "title": widget.title,
                            "tag": widget.tag,
                            "description": widget.description,
                            "price": widget.price,
                            "negotiate": widget.negotiate,
                            "selectedImages": selectedImages,
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
