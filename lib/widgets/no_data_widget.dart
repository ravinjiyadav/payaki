import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class NoDataWidget extends StatelessWidget {

  final String title;
  const NoDataWidget({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 65.w),
          child: Image.asset(ImageUtility.emptyCartImage),
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          title,
          style: StyleUtility.noDataTextStyle,
        )
      ],
    );
  }
}
