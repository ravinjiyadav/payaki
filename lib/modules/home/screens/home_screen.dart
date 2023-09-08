import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/home/viewModel/home_screen_vm.dart';
import 'package:payaki/modules/home/widget/home_post_widget.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/search/search_request.dart';
import 'package:payaki/network/model/response/category/category_list_response.dart'
    as category;
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenVm homeScreenVm = HomeScreenVm();

  @override
  void initState() {
    super.initState();
    homeScreenVm = Provider.of<HomeScreenVm>(context, listen: false);
    homeScreenVm.fetchCategoryList(
        onSuccess: (value) {},
        onFailure: (message) {
          context.flushBarTopErrorMessage(message: message);
        });

    homeScreenVm.fetchPremiumAndLatestPost(
        onSuccess: (value) {},
        onFailure: (message) {
          context.flushBarTopErrorMessage(message: message);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtility.whiteColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.searchScreen);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Image.asset(
                          ImageUtility.searchIcon,
                          width: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                InkWell(
                  onTap: (){
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: Image.asset(
                      ImageUtility.notificationIcon,
                      width: 16.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: ColorUtility.colorF6F6F6,
      body: Consumer<HomeScreenVm>(builder: (context, homeScreenVm, child) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorUtility.whiteColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    categoryListView(homeScreenVm.categoryList,
                        homeScreenVm.isCategoryLoading),
                  ],
                ),
              ),
              if (homeScreenVm.isPremiumAndLatestPostLoading == true)
                SizedBox(
                  height: 350.h,
                  child: const CircularProgressWidget(),
                )
              else
                Column(
                  children: [
                    SizedBox(
                      height: 37.h,
                    ),
                    HomePostWidget(
                      title: "Premium Ad",
                      post: homeScreenVm.premiumAndLatestPost?.data?.premium,
                      onSeeAllTap: () {
                        CommonDialog.showLoadingDialog(context);
                        homeScreenVm.searchPostApi(
                            searchRequest: SearchRequest(
                                name: Endpoints.search.getAllPost,
                                param: Param(
                                  listingType: Constant.premium,
                                )),
                            onSuccess: (searchPostList) {
                              Navigator.pop(context);

                              Navigator.pushNamed(
                                  context, RouteName.searchResultScreen,
                                  arguments: {
                                    "initialPostList": searchPostList,
                                    "headerTitle": "Premium Ad",
                                    "listingType": Constant.premium,
                                  });
                            },
                            onFailure: (value) {
                              Navigator.pop(context);
                              context.flushBarTopErrorMessage(message: value);
                            });
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    HomePostWidget(
                      title: "Latest Ad",
                      post: homeScreenVm.premiumAndLatestPost?.data?.latest,
                      onSeeAllTap: () {
                        CommonDialog.showLoadingDialog(context);
                        homeScreenVm.searchPostApi(
                            searchRequest: SearchRequest(
                                name: Endpoints.search.getAllPost,
                                param: Param(
                                  listingType: Constant.latest,
                                )),
                            onSuccess: (searchPostList) {
                              Navigator.pop(context);

                              Navigator.pushNamed(
                                  context, RouteName.searchResultScreen,
                                  arguments: {
                                    "initialPostList": searchPostList,
                                    "headerTitle": "Latest Ad",
                                    "listingType": Constant.latest,
                                  });
                            },
                            onFailure: (value) {
                              Navigator.pop(context);
                              context.flushBarTopErrorMessage(message: value);
                            });
                      },
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                  ],
                )
            ],
          ),
        );
      }),
    );
  }

  Widget categoryListView(
      List<category.Data>? categoryList, bool isCategoryLoading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Text(
            "Browse Categories",
            style: StyleUtility.headingTextStyle,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          height: 150.sp,
          child: isCategoryLoading == true
              ? const Center(child: CircularProgressWidget())
              : ListView.builder(
                  padding: EdgeInsets.only(left: 20.w),
                  scrollDirection: Axis.horizontal,
                  // itemCount: 21,
                  itemCount: categoryList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(right: 34.w),
                        child: Wrap(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  CommonDialog.showLoadingDialog(context);
                                  homeScreenVm.searchPostApi(
                                      searchRequest: SearchRequest(
                                          name: Endpoints.search.getAllPost,
                                          param: Param(
                                            category:
                                                categoryList?[index].catId,
                                          )),
                                      onSuccess: (searchPostList) {
                                        Navigator.pop(context);
                                        Navigator.pushNamed(context,
                                            RouteName.searchResultScreen,
                                            arguments: {
                                              "initialPostList": searchPostList,
                                              "headerTitle":
                                                  categoryList?[index].catName,
                                              "category":
                                                  categoryList?[index].catId,
                                            });
                                      },
                                      onFailure: (value) {
                                        Navigator.pop(context);
                                        context.flushBarTopErrorMessage(message: value);
                                      });
                                },
                                child: SizedBox(
                                  width: 70.sp,
                                  //  height: 70.sp,
                                  child: Column(
                                    children: [
                                      Container(
                                          width: 70.sp,
                                          height: 70.sp,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorUtility.colorF5F6FA),
                                          child: Center(
                                              child: Padding(
                                            padding: EdgeInsets.all(20.sp),
                                            child: NetworkImageWidget(
                                                width: 25.w,
                                                height: 25.w,
                                                url: categoryList?[index]
                                                        .picture ??
                                                    ""),
                                          ))),
                                      SizedBox(
                                        height: 5.sp,
                                      ),
                                      Text(
                                        categoryList?[index].catName ?? "",
                                        style: StyleUtility.titleTextStyle
                                            .copyWith(
                                                fontSize:
                                                    TextSizeUtility.textSize12),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  }),
        ),
      ],
    );
  }
}
