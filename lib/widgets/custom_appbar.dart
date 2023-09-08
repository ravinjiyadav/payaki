import 'package:flutter/material.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool? isShowBackButton;

   const CustomAppBar({super.key, required this.title,
      this.isShowBackButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorUtility.whiteColor,
        title: Text(
          title,
          style: StyleUtility.headerTextStyle,
        ),
        centerTitle: true,
        elevation: 1,
        leading:
      isShowBackButton == true ?  const BackButton(
          color: Colors.black, // <-- SEE HERE
        ):null,



        shadowColor: ColorUtility.colorE2E5EF
    );
  }



  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
