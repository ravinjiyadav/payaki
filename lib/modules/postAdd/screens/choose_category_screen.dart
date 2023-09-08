import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/postAdd/provider/choose_category_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';

class ChooseCategoryScreen extends StatefulWidget {
  const ChooseCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCategoryScreen> createState() => _ChooseCategoryScreenState();
}

class _ChooseCategoryScreenState extends State<ChooseCategoryScreen> {
  ChooseCategoryScreenVm chooseCategoryScreenVm = ChooseCategoryScreenVm();

  @override
  void initState() {
    super.initState();

    logD("User Id is ${Preference().getUserId()}");
    chooseCategoryScreenVm =
        Provider.of<ChooseCategoryScreenVm>(context, listen: false);
    chooseCategoryScreenVm.categoryListApi(
        onSuccess: (value) {},
        onFailure: (String message) {
          Navigator.pop(context);
          context.flushBarTopErrorMessage(message: message);
        });
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
              SizedBox(
                height: 23.h,
              ),
              Text(
                "Choose Category",
                style: StyleUtility.headingTextStyle,
              ),
              Expanded(child: Consumer<ChooseCategoryScreenVm>(
                  builder: (context, chooseCategoryScreenVm, child) {
                return chooseCategoryScreenVm.isLoading == true
                    ? const Center(child: CircularProgressWidget())
                    : ListView.builder(
                        itemCount: chooseCategoryScreenVm.categoryList?.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.subCategoryScreen,
                                  arguments: {
                                    "catId": int.parse(chooseCategoryScreenVm
                                        .categoryList![index].catId!),
                                    "catName": chooseCategoryScreenVm
                                        .categoryList?[index].catName
                                  });
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.w, vertical: 0),
                              horizontalTitleGap: 0,
                              title: Text(
                                // "Cars $index",
                                chooseCategoryScreenVm
                                        .categoryList![index].catName ??
                                    "",
                                style: StyleUtility.titleTextStyle,
                              ),
                              // leading: Image.asset(
                              //   ImageUtility.carImage,
                              //   width: 25.w,
                              // ),
                              leading: NetworkImageWidget(
                                  width: 25.w,
                                  height: 25.w,
                                  url: chooseCategoryScreenVm
                                          .categoryList![index].picture ??
                                      ""),
                              trailing: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18.sp,
                                color: ColorUtility.color43576F,
                              ),
                            ),
                          );
                        });
              }))
            ],
          ),
        ),
      ),
    );
  }
}
