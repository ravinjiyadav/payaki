import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/inputFormatter/decimal_input_formatter.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/search/providers/search_result_screen_vm.dart';
import 'package:payaki/modules/search/widget/short_by_list_tile.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/search/search_request.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/widgets/grid_item_widget.dart';
import 'package:payaki/network/model/response/post/post_list_response.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

class SearchResultScreen extends StatefulWidget {
  final List<Data> initialPostList;
  final String headerTitle;

  final String? title;
  final String? category;
  final String? location;
  final String? city;
  final String? country;
  final String? state;
  final String? listingType;

  const SearchResultScreen(
      {Key? key,
      required this.initialPostList,
      required this.headerTitle,
      this.title,
      this.category,
      this.location,
      this.city,
      this.country,
      this.state,
      this.listingType})
      : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  TextEditingController priceToController = TextEditingController();
  TextEditingController priceFromController = TextEditingController();

  List<Data>? filterPostList;

  String? selectedShortByValue; //no radio button will be selected on initial

  String name = "product_name_asc";
  String date = "created_at_desc";
  String priceLowToHeigh = "price_asc";
  String priceHeighToLow = "price_desc";

  @override
  void initState() {
    super.initState();
    filterPostList = widget.initialPostList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: CustomAppBar(title: widget.headerTitle),
      body: Consumer<SearchResultScreenVm>(
          builder: (context, searchResultScreenVm, child) {
        return Column(
          children: [
            SizedBox(
              height: 13.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showShortByDialog(context, searchResultScreenVm);
                      },
                      child: Container(
                        height: 45.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            border:
                                Border.all(color: ColorUtility.colorE2E5EF)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageUtility.shortByIcon,
                              height: 10.sp,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "Sort by",
                              style: StyleUtility.titleTextStyle
                                  .copyWith(color: ColorUtility.color1E1E1E),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showFilterDialog(context, searchResultScreenVm);
                      },
                      child: Container(
                        height: 45.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            border:
                                Border.all(color: ColorUtility.colorE2E5EF)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageUtility.filterIcon,
                              height: 10.sp,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "Filter",
                              style: StyleUtility.titleTextStyle
                                  .copyWith(color: ColorUtility.color1E1E1E),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Expanded(
              child: Container(
                color: ColorUtility.colorF6F6F6,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: (filterPostList?.length ?? 0) > 0
                      ? GridView.builder(
                          padding: EdgeInsets.only(top: 20.h, bottom: 50.h),
                          itemCount: filterPostList?.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.w,
                                  mainAxisSpacing: 15.w,
                                  // childAspectRatio: 0.90
                                  childAspectRatio: 0.82),
                          itemBuilder: (context, index) {
                            String? image;

                            if ((filterPostList?[index].image?.length ?? 0) >
                                0) {
                              image = filterPostList?[index].image?[0];
                            }

                            String? type;
                            if (filterPostList?[index].featured == "1") {
                              type = "Featured";
                            } else if (filterPostList?[index].urgent == "1") {
                              type = "Urgent";
                            } else if (filterPostList?[index].highlight ==
                                "1") {
                              type = "Highlight";
                            }
                            return GridItemWidget(
                              imageUrl: image ?? "",
                              price: filterPostList?[index].price ?? "",
                              title: filterPostList?[index].productName ?? "",
                              address: filterPostList?[index].fullAddress ?? "",
                              expiredDate: filterPostList?[index].expiredDate,
                              isVerified: filterPostList?[index].isVerified,
                              urgent: filterPostList?[index].urgent,
                              featured: filterPostList?[index].featured,
                              highlight: filterPostList?[index].highlight,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.postDetailsScreen,
                                    arguments: {
                                      "postId": filterPostList?[index].id
                                    });
                              },
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "No Post Found",
                            style: StyleUtility.headingTextStyle,
                          ),
                        ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Future<dynamic> showFilterDialog(
    BuildContext context,
    SearchResultScreenVm searchResultScreenVm,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          insetPadding: EdgeInsets.only(left: 20.w, right: 20.w),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 17.w, right: 17.w, top: 25.w, bottom: 25.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Filter",
                      style: StyleUtility.headingTextStyle,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Price Range",
                      style: StyleUtility.inputTextStyle,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SimpleTextField(
                          controller: priceFromController,
                          textInputType: TextInputType.number,
                          hintText: "From",
                          inputFormatter: [
                            DecimalInputFormatter(),
                          ],
                        )),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                            child: SimpleTextField(
                          controller: priceToController,
                          textInputType: TextInputType.number,
                          hintText: "To",
                          inputFormatter: [
                            DecimalInputFormatter(),
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomButton.outline(
                                buttonText: "Reset",
                                onTab: () {
                                  Navigator.pop(context);
                                  resetFilter(searchResultScreenVm);
                                })),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                            child: CustomButton(
                                buttonText: "Done",
                                onTab: () {
                                  if (priceFromController.text.isEmpty) {
                                    context.flushBarTopErrorMessage(
                                        message:
                                            "Please Enter Price From Value");
                                  } else if (priceFromController.text.isEmpty) {
                                    context.flushBarTopErrorMessage(
                                        message:
                                            "Please Enter Price From Value");
                                  } else {
                                    Navigator.pop(context);

                                    onFilterApply(searchResultScreenVm);
                                  }
                                })),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showShortByDialog(
    BuildContext context,
    SearchResultScreenVm searchResultScreenVm,
  ) {
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.only(left: 20.w, right: 20.w),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 17.w, right: 17.w, top: 25.w, bottom: 25.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Sort by",
                          style: StyleUtility.headingTextStyle,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ShortByListTile(
                            title: "Name",
                            value: name,
                            selectedShortByValue: selectedShortByValue ?? "",
                            onChanged: (value) {
                              setState(() {
                                selectedShortByValue = name;
                              });
                            }),
                        ShortByListTile(
                            title: "Date",
                            value: date,
                            selectedShortByValue: selectedShortByValue ?? "",
                            onChanged: (value) {
                              setState(() {
                                selectedShortByValue = date;
                              });
                            }),
                        ShortByListTile(
                            title: "Price : Low to High",
                            value: priceLowToHeigh,
                            selectedShortByValue: selectedShortByValue ?? "",
                            onChanged: (value) {
                              setState(() {
                                selectedShortByValue = priceLowToHeigh;
                              });
                            }),
                        ShortByListTile(
                            title: "Price : High to low",
                            value: priceHeighToLow,
                            selectedShortByValue: selectedShortByValue ?? "",
                            onChanged: (value) {
                              setState(() {
                                selectedShortByValue = priceHeighToLow;
                              });
                            }),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomButton.outline(
                                    buttonText: "Reset",
                                    onTab: () {
                                      Navigator.pop(context);
                                      resetFilter(searchResultScreenVm);
                                    })),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                                child: CustomButton(
                                    buttonText: "Done",
                                    onTab: () {
                                      if (selectedShortByValue == null) {
                                        context.flushBarTopErrorMessage(
                                            message: "Please Select Short By");
                                      } else {
                                        Navigator.pop(context);

                                        onFilterApply(searchResultScreenVm);
                                      }
                                    })),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  void resetFilter(SearchResultScreenVm searchResultScreenVm) {
    priceFromController.clear();
    priceToController.clear();

    selectedShortByValue = null;

    logD("Length ${widget.initialPostList.length}");
    filterPostList = widget.initialPostList.toList();

    searchResultScreenVm.notifyListeners();
  }

  void onFilterApply(SearchResultScreenVm searchResultScreenVm) {
    filterPostList?.clear();
    CommonDialog.showLoadingDialog(context);
    searchResultScreenVm.searchPostApi(
        searchRequest: SearchRequest(
            name: Endpoints.search.getAllPost,
            param: Param(
              title: widget.title,
              category: widget.category,
              location: widget.location,
              city: widget.city,
              country: widget.country,
              state: widget.state,
              pricefrom: priceFromController.text,
              priceto: priceToController.text,
              sortbyfieldname: selectedShortByValue,
              listingType: widget.listingType,
            )),
        onSuccess: (searchedPostList) {
          Navigator.pop(context);

          filterPostList = searchedPostList;

          searchResultScreenVm.notifyListeners();
        },
        onFailure: (value) {
          Navigator.pop(context);
          context.flushBarTopErrorMessage(message: value);
        });
  }
}
