import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/myAds/viewModel/my_ads_screen_vm.dart';
import 'package:payaki/network/model/response/post/post_list_response.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/delete_alert_dialog.dart';
import 'package:payaki/widgets/grid_item_widget.dart';
import 'package:payaki/widgets/no_data_widget.dart';
import 'package:provider/provider.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  MyAdsScreenVm myAdsScreenVm = MyAdsScreenVm();

  @override
  void initState() {
    super.initState();
    myAdsScreenVm = Provider.of(context, listen: false);
    myAdsScreenVm.getMyAds(onFailure: _onFailure);
    myAdsScreenVm.getFavouriteAds(onFailure: _onFailure);
    myAdsScreenVm.getPendingAds(onFailure: _onFailure);
    myAdsScreenVm.getExpiredAds(onFailure: _onFailure);
  }

  void _onFailure(String message) {
    context.flushBarTopErrorMessage(message: message);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ColorUtility.whiteColor,
        appBar: const CustomAppBar(title: "My Ads", isShowBackButton: false),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              TabBar(
                labelPadding: const EdgeInsets.all(0),
                unselectedLabelColor: ColorUtility.color8B97A4,
                labelColor: ColorUtility.color152D4A,
                labelStyle: StyleUtility.inputTextStyle,
                unselectedLabelStyle: StyleUtility.hintTextStyle,
                indicatorColor: ColorUtility.color152D4A,
                tabs: [
                  Tab(
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorUtility.colorE2E5EF))),
                        child: const Center(
                            child: Text(
                          'My Ads',
                          textAlign: TextAlign.center,
                        ))),
                  ),
                  Tab(
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorUtility.colorE2E5EF))),
                        child: const Center(
                            child: Text(
                          'Favourite Ads',
                          textAlign: TextAlign.center,
                        ))),
                  ),
                  Tab(
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorUtility.colorE2E5EF))),
                        child: const Center(
                            child: Text(
                          'Pending Ads',
                          textAlign: TextAlign.center,
                        ))),
                  ),
                  Tab(
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorUtility.colorE2E5EF))),
                        child: const Center(
                            child: Text(
                          'Expired Ads',
                          textAlign: TextAlign.center,
                        ))),
                  ),
                ],
              ),
              Expanded(
                child: Consumer<MyAdsScreenVm>(
                    builder: (context, myAdsScreenVm, child) {
                  return Container(
                    color: ColorUtility.colorF6F6F6,
                    child: TabBarView(
                      children: [
                        // My Ads
                        myAdsScreenVm.myAdsListLoading == true
                            ? const CircularProgressWidget()
                            : AddListWidget(
                                adsList: myAdsScreenVm.myAdsList,
                                isShowDeleteIcon: true,
                              ),

                        // Favourite Ads
                        myAdsScreenVm.favouriteAdsListLoading == true
                            ? const CircularProgressWidget()
                            : AddListWidget(
                                adsList: myAdsScreenVm.favouriteAdsList,
                                isFavouriteList: true,
                              ),

                        // Pending Ads
                        myAdsScreenVm.pendingAdsListLoading == true
                            ? const CircularProgressWidget()
                            : AddListWidget(
                                adsList: myAdsScreenVm.pendingAdsList,
                                isShowDeleteIcon: true,
                                isPendingPost: true,
                              ),

                        //Expired Ads
                        myAdsScreenVm.expiredAdsListLoading == true
                            ? const CircularProgressWidget()
                            : AddListWidget(
                                adsList: myAdsScreenVm.expiredAdsList,
                                isExpiredList: true,
                              ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddListWidget extends StatelessWidget {
  final bool? isFavouriteList;
  final bool? isExpiredList;
  final bool? isShowDeleteIcon;
  final List<Data>? adsList;
  final bool? isPendingPost;

  const AddListWidget({
    super.key,
    this.adsList,
    this.isFavouriteList,
    this.isExpiredList,
    this.isShowDeleteIcon,
    this.isPendingPost,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: (adsList?.length ?? 0) > 0
          ? GridView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(top: 20.h, bottom: 60.h),
              itemCount: adsList?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 15.w,
                  childAspectRatio: 0.82),
              itemBuilder: (context, index) {
                String? image;
                if ((adsList?[index].image?.length ?? 0) > 0) {
                  image = adsList?[index].image?[0];
                }

                return GridItemWidget(
                  price: adsList?[index].price ?? "",
                  title: adsList?[index].productName ?? "",
                  address: adsList?[index].fullAddress ?? "",
                  imageUrl: image ?? "",
                  expiredDate: adsList?[index].expiredDate,
                  isVerified: adsList?[index].isVerified,
                  urgent: adsList?[index].urgent,
                  featured: adsList?[index].featured,
                  highlight: adsList?[index].highlight,
                  isFavouriteList: isFavouriteList,
                  isExpiredList: isExpiredList,
                  isShowDeleteIcon: isShowDeleteIcon,
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.postDetailsScreen,
                            arguments: {"postId": adsList?[index].id})
                        .then((value) {
                      Provider.of<MyAdsScreenVm>(context, listen: false)
                          .getFavouriteAds();
                    });
                  },
                  onFavouriteIconTap: () {
                    CommonDialog.showLoadingDialog(context);
                    Provider.of<MyAdsScreenVm>(context, listen: false)
                        .postLikeDislike(
                            postId: adsList?[index].id ?? "",
                            index: index,
                            onSuccess: (message) {
                              Navigator.pop(context);
                              context.flushBarTopSuccessMessage(
                                  message: message);
                            },
                            onFailure: (message) {
                              Navigator.pop(context);
                              context.flushBarTopErrorMessage(message: message);
                            });
                  },
                  onDeleteIconTap: () {
                    showDeletePostDialog(
                      context: context,
                      onDeleteTap: () {
                        CommonDialog.showLoadingDialog(context);
                        Provider.of<MyAdsScreenVm>(context, listen: false)
                            .deletePost(
                                postId: adsList?[index].id ?? "",
                                index: index,
                                isPendingPost: isPendingPost ?? false,
                                onSuccess: (message) {
                                  Navigator.pop(context);
                                  context.flushBarTopSuccessMessage(
                                      message: message);
                                },
                                onFailure: (message) {
                                  Navigator.pop(context);
                                  context.flushBarTopErrorMessage(
                                      message: message);
                                });
                      },
                    );
                  },
                );
              },
            )
          :


       const NoDataWidget(title: 'You haven’t listed anything yet.',),

    );
  }

  Future<dynamic> showDeletePostDialog({
    required BuildContext context,
    required VoidCallback onDeleteTap,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return DeleteAlertDialog(
            onDeleteTap: onDeleteTap,
          );
        });
  }
}
