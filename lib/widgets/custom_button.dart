import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';

class CustomButton extends StatelessWidget {
  final int buttonType; // 0 elevated, 1 outlined , 2 TextButton,3 outlineWithIcon,4 transparentButton

   CustomButton({
    Key? key,
    required this.buttonText,
    required this.onTab,
  })  : buttonType = 0,
        super(key: key);

   CustomButton.text({
    Key? key,
    required this.buttonText,
    required this.onTab,
  })  : buttonType = 1,
        super(key: key);

   CustomButton.outline({
    Key? key,
    required this.buttonText,
    required this.onTab,
  })  : buttonType = 2,
        super(key: key);

   CustomButton.withIcon({
    Key? key,
    required this.buttonText,
    required this.onTab,
    required this.icon,
  })  : buttonType = 3,
        super(key: key);



  final String buttonText;
   String? icon;


  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    if (buttonType == 1) {
      return TextButton(
          onPressed: onTab,
          style: OutlinedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 50),
          ),
          child: Text(
            buttonText,
            maxLines: 1,
            style: StyleUtility.buttonTextStyle.copyWith(
              color: ColorUtility.color282828
            )
          ));
    }
    if (buttonType == 2) {
      return SizedBox(
        height: TextSizeUtility.buttonHeight,
        width: MediaQuery.of(context).size.width,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            side: const BorderSide(color: ColorUtility.color9C5FA3, width: 2),
          ),
          onPressed: onTab,
          child: Text(
            buttonText,
            maxLines: 1,
            style: StyleUtility.buttonTextStyle.copyWith(
                color: ColorUtility.color9C5FA3
            ),
          ),
        ),
      );
    }if (buttonType == 3) {
      return SizedBox(
        height: TextSizeUtility.buttonHeight,
        width: MediaQuery.of(context).size.width,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            side: const BorderSide(color: ColorUtility.color9C5FA3, width: 2),
          ),
          onPressed: onTab,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(icon!,width: 20.sp,height: 20.sp,),
              SizedBox(width: 10.h,),
              Text(
                buttonText,
                maxLines: 1,
                style: StyleUtility.buttonTextStyle.copyWith(
                    color: ColorUtility.color9C5FA3
                ),
              ),
            ],
          ),
        ),
      );
    }





    Gradient gradient = const LinearGradient(
        colors: [ColorUtility.color9C5FA3,
          ColorUtility.color844193
        ]);

    final borderRadius = BorderRadius.circular(10.r);

    return Container(
      height: TextSizeUtility.buttonHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
          onPressed: () {
            onTab();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
          ),
          child: Text(buttonText,
              maxLines: 1, style: StyleUtility.buttonTextStyle)),
    );
  }
}

//
// class CallButton extends StatelessWidget {
//   const CallButton({
//     Key? key,
//     required this.buttonText,
//     required this.onTab,
//     this.color = CustomColors.colorF0F6FB, required this.icon,
//   }) : super(key: key);
//
//   final String buttonText;
//   final VoidCallback onTab;
//   final Color color;
//   final Icon icon;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 35,
//       width: MediaQuery.of(context).size.width,
//       child: ElevatedButton(
//
//           onPressed: () {
//             onTab();
//           },
//
//           style: ElevatedButton.styleFrom(
//             elevation: 0,
//
//
//
//             //fixedSize: Size(MediaQuery.of(context).size.width, 50),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(7.sp),
//             ),
//             backgroundColor: color,
//           ),
//
//
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               icon,
//               SizedBox(width: 10.w,),
//               Text(
//                 buttonText,
//                 maxLines: 1,
//                 style: Styles.axiforma400.copyWith(
//                   color: CustomColors.color535353,
//                   fontSize: TextSize.textSize14,
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
