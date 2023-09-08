import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/postAdd/provider/sub_category_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class SubCategoryScreen extends StatefulWidget {
  final int catId;
  final String catName;

  const SubCategoryScreen(
      {Key? key, required this.catId, required this.catName})
      : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  SubCategoryScreenVm subCategoryScreenVm = SubCategoryScreenVm();

  @override
  void initState() {
    super.initState();

    subCategoryScreenVm =
        Provider.of<SubCategoryScreenVm>(context, listen: false);
    subCategoryScreenVm.subCategoryListApi(
        onSuccess: (value) {},
        onFailure: (String message) {
          Navigator.pop(context);
          context.flushBarTopErrorMessage(message: message);
        },
        catId: widget.catId);
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
                widget.catName,
                style: StyleUtility.headingTextStyle,
              ),
              Expanded(child: Consumer<SubCategoryScreenVm>(
                  builder: (context, subCategoryScreenVm, child) {
                return subCategoryScreenVm.isLoading == true
                    ? const Center(child: CircularProgressWidget())
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 18.h),
                        itemCount: subCategoryScreenVm.subCategoryList?.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.addDetailScreen,
                                  arguments: {
                                    "catId": widget.catId,
                                    "subCatId": int.parse(subCategoryScreenVm
                                        .subCategoryList![index].subCatId!)
                                  });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 12.h, bottom: 12.h, left: 12.w),
                              child: Text(
                                subCategoryScreenVm
                                        .subCategoryList![index].subCatName ??
                                    "",
                                style: StyleUtility.titleTextStyle,
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
