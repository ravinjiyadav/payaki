import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/grid_item_widget.dart';
import 'package:payaki/network/model/response/post/post_list_response.dart';

class HomePostWidget extends StatelessWidget {
  final List<Data>? post;
  final String title;
  final VoidCallback onSeeAllTap;

  const HomePostWidget({
    super.key,
    this.post,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: StyleUtility.headingTextStyle,
              ),
              InkWell(
                onTap: onSeeAllTap,
                child: Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Text(
                    "See All",
                    style: StyleUtility.titleTextStyle.copyWith(
                        fontSize: TextSizeUtility.textSize12,
                        color: ColorUtility.color152D4A),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: (post?.length ?? 0) > 0
              ? GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.only(
                    top: 20.h,
                  ),
                  itemCount: post?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 15.w,
                      // childAspectRatio: 0.90
                      childAspectRatio: 0.82),
                  itemBuilder: (context, index) {
                    String? image;
                    if ((post?[index].image?.length ?? 0) > 0) {
                      image = post?[index].image?[0];
                    }

                    return GridItemWidget(
                      price: post?[index].price ?? "",
                      title: post?[index].productName ?? "",
                      address: post?[index].fullAddress ?? "",
                      imageUrl: image ?? "",
                      expiredDate: post?[index].expiredDate,
                      isVerified: post?[index].isVerified,
                      urgent: post?[index].urgent,
                      featured: post?[index].featured,
                      highlight: post?[index].highlight,
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteName.postDetailsScreen,
                            arguments: {"postId": post?[index].id});
                      },
                    );
                  },
                )
              : SizedBox(
                  height: 100.sp,
                  child: Center(
                    child: Text(
                      "No Post Found",
                      style: StyleUtility.inputTextStyle,
                    ),
                  )),
        ),
      ],
    );
  }
}
