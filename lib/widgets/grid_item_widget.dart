import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/network_image_widget.dart';

class GridItemWidget extends StatelessWidget {
  final String price;
  final String title;
  final String address;
  final String imageUrl;
  final String? expiredDate;
  final String? isVerified;
  final String? urgent;
  final String? featured;
  final String? highlight;
  final bool? isFavouriteList;
  final bool? isShowDeleteIcon;
  final bool? isExpiredList;

  final VoidCallback? onTap;
  final VoidCallback? onFavouriteIconTap;
  final VoidCallback? onDeleteIconTap;

  const GridItemWidget({
    super.key,
    required this.price,
    required this.title,
    required this.address,
    required this.imageUrl,
    required this.expiredDate,
    required this.isVerified,
    required this.onTap,
    this.onFavouriteIconTap,
    this.onDeleteIconTap,
    required this.urgent,
    required this.featured,
    required this.highlight,
    this.isFavouriteList = false,
    this.isExpiredList = false,
    this.isShowDeleteIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.brown.withOpacity(0.5),
      child: Container(
        decoration: isExpiredList == true
            ? BoxDecoration(
                border: Border.all(color: ColorUtility.colorE9380A, width: 1.5),
                borderRadius: BorderRadius.circular(10.r))
            : null,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      topLeft: Radius.circular(10.r)),
                  child: NetworkImageWidget(
                    height: 110.sp,
                    url: imageUrl,
                    width: double.infinity,
                    errorIconSize: 40.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          urgent == "1"
                              ? Container(
                                  width: 80.sp,
                                  padding:
                                      EdgeInsets.only(top: 4.w, bottom: 4.w),
                                  margin: EdgeInsets.only(bottom: 3.sp),
                                  decoration: BoxDecoration(
                                      color: ColorUtility.colorEDA830
                                          .withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(3.r)),
                                  child: Center(
                                    child: Text(("Urgent").toUpperCase(),
                                        style: StyleUtility.typeStyle),
                                  ))
                              : const SizedBox(),
                          featured == "1"
                              ? Container(
                                  width: 80.sp,
                                  padding:
                                      EdgeInsets.only(top: 4.w, bottom: 4.w),
                                  margin: EdgeInsets.only(bottom: 3.sp),
                                  decoration: BoxDecoration(
                                      color: ColorUtility.color43A047
                                          .withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(3.r)),
                                  child: Center(
                                    child: Text(("featured").toUpperCase(),
                                        style: StyleUtility.typeStyle),
                                  ))
                              : const SizedBox(),
                          highlight == "1"
                              ? Container(
                                  width: 80.sp,
                                  padding:
                                      EdgeInsets.only(top: 4.w, bottom: 4.w),
                                  decoration: BoxDecoration(
                                      color: ColorUtility.color4285F4
                                          .withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(3.r)),
                                  child: Center(
                                    child: Text(("HIGHLIGHT").toUpperCase(),
                                        style: StyleUtility.typeStyle),
                                  ))
                              : const SizedBox(),
                        ],
                      ),
                      isVerified == "1"
                          ? Image.asset(
                              ImageUtility.verifiedPostIcon,
                              width: 26.w,
                            )
                          : const SizedBox(),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorUtility.whiteColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 7.w, top: 7.w, right: 4.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹ $price",
                        style: StyleUtility.headingTextStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        title,
                        style: StyleUtility.titleTextStyle
                            .copyWith(color: ColorUtility.color8B97A4),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 13.sp,
                            color: ColorUtility.colorC0C0C0,
                          ),
                          Expanded(
                            child: Text(
                              address,
                              style: StyleUtility.titleTextStyle.copyWith(
                                  fontSize: TextSizeUtility.textSize10,
                                  color: ColorUtility.colorC0C0C0),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Row(
                          children: [
                            expiredDate != null
                                ? Expanded(
                                    child: Text(
                                      "Exp. ${Moment(DateTime.parse(expiredDate!)).fromNow()}",
                                      style: StyleUtility.titleTextStyle
                                          .copyWith(
                                              color: ColorUtility.color323436),
                                      maxLines: 1,
                                    ),
                                  )
                                : const SizedBox(),
                            isFavouriteList == true
                                ? InkWell(
                                    onTap: onFavouriteIconTap,
                                    child: Image.asset(
                                      ImageUtility.favIcon,
                                      height: 18.sp,
                                    ),
                                  )
                                : const SizedBox(),
                            isShowDeleteIcon == true
                                ? InkWell(
                                    onTap: onDeleteIconTap,
                                    child: Image.asset(
                                      ImageUtility.deleteIcon,
                                      color: ColorUtility.colorEB4335,
                                      height: 22.sp,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
