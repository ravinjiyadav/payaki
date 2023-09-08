import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class SettingTileWidget extends StatelessWidget {
  final String title;
  final String image;
  final double imageWidth;
  final VoidCallback? onTap;
  const SettingTileWidget({
    super.key, required this.title, required this.image,  this.onTap, required this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [

            Image.asset(image,width: imageWidth,
              color: ColorUtility.color43576F,
            ),
            SizedBox(width: 16.w,),
            Expanded(child: Text(title,style: StyleUtility.titleTextStyle,))
          ],
        ),
      ),
    );
  }
}
