import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/transaction/viewModel/transaction_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TransactionScreenVm transactionScreenVm = TransactionScreenVm();

  @override
  void initState() {
    super.initState();
    transactionScreenVm =
        Provider.of<TransactionScreenVm>(context, listen: false);
    transactionScreenVm.getTransactionList(onFailure: (message) {
      Navigator.pop(context);
      context.flushBarTopErrorMessage(message: message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorF6F6F6,
      appBar: const CustomAppBar(title: "Transaction"),
      body: Consumer<TransactionScreenVm>(builder: (context, model, child) {
        var transactionList = model.transactionListResponse?.data;
        return model.isLoading == true
            ? const Center(
                child: CircularProgressWidget(),
              )
            : (transactionList?.length ?? 0) > 0
                ? ListView.builder(
                    padding: EdgeInsets.only(top: 25.h, bottom: 50.h),
                    itemCount: transactionList?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {

                          Navigator.pushNamed(
                              context, RouteName.transactionDetailScreen,
                          arguments: {
                                "transaction":transactionList?[index]
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 20.w, right: 20.w, bottom: 15.h),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 12.w,
                                    right: 12.w,
                                    top: 9.h,
                                    bottom: 17.h),
                                decoration: BoxDecoration(
                                    color: ColorUtility.whiteColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r),
                                        topRight: Radius.circular(10.r))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                transactionList?[index].transactionTime ?? "",
                                   // DateFormat('yyyy-MM-dd').format(DateTime.parse("${transactionList?[index].transactionTime}")),
                                        //  "2022/11/06",
                                          style: StyleUtility.titleTextStyle
                                              .copyWith(
                                                  color:
                                                      ColorUtility.color8B97A4),
                                        ),
                                        Expanded(
                                          child: Wrap(
                                            alignment: WrapAlignment.end,
                                            children: [
                                              if (transactionList?[index]
                                                      .urgent ==
                                                  "1")
                                                Text(
                                                  "URGENT",
                                                  style: StyleUtility
                                                      .titleTextStyle
                                                      .copyWith(
                                                          color: ColorUtility
                                                              .color5DB85C,
                                                          fontSize:
                                                              TextSizeUtility
                                                                  .textSize12),
                                                ),
                                              if (transactionList?[index]
                                                      .featured ==
                                                  "1")
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 5.w),
                                                  child: Text(
                                                    "FEATURED",
                                                    style: StyleUtility
                                                        .titleTextStyle
                                                        .copyWith(
                                                            color: ColorUtility
                                                                .colorF1AD4E,
                                                            fontSize:
                                                                TextSizeUtility
                                                                    .textSize12),
                                                  ),
                                                ),
                                              if (transactionList?[index]
                                                      .highlight ==
                                                  "1")
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 5.w),
                                                  child: Text(
                                                    "HIGHLIGHT",
                                                    style: StyleUtility
                                                        .titleTextStyle
                                                        .copyWith(
                                                            color: ColorUtility
                                                                .color5BC1DF,
                                                            fontSize:
                                                                TextSizeUtility
                                                                    .textSize12),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7.sp,
                                    ),
                                    Text(
                                      transactionList?[index].productName ?? "",
                                      style: StyleUtility.titleTextStyle
                                          .copyWith(
                                              fontSize:
                                                  TextSizeUtility.textSize15),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 7.sp,
                                    ),
                                    Text(
                                      "₹ ${transactionList?[index].amount ?? ""}",
                                      style: StyleUtility.headerTextStyle
                                          .copyWith(
                                              fontSize:
                                                  TextSizeUtility.textSize22),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 1.0,
                                color: ColorUtility.colorE2E5EF,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 12.w,
                                    right: 12.w,
                                    top: 9.h,
                                    bottom: 7.h),
                                decoration: BoxDecoration(
                                    color: ColorUtility.colorF8FAFB,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.r),
                                        bottomRight: Radius.circular(10.r))),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Payment method".toUpperCase(),
                                          style: StyleUtility.titleTextStyle
                                              .copyWith(
                                                  fontSize: TextSizeUtility
                                                      .textSize12),
                                        ),
                                        Text(
                                          "Status".toUpperCase(),
                                          style: StyleUtility.titleTextStyle
                                              .copyWith(
                                                  fontSize: TextSizeUtility
                                                      .textSize12),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          transactionList?[index]
                                                  .transactionGatway ??
                                              "",
                                          style: StyleUtility.axiforma500
                                              .copyWith(
                                                  fontSize: TextSizeUtility
                                                      .textSize16,
                                                  color:
                                                      ColorUtility.color152D4A),
                                        ),
                                        Text(
                                          transactionList?[index]
                                                  .status
                                                  ?.toUpperCase() ??
                                              "",
                                          style: StyleUtility.axiforma500
                                              .copyWith(
                                                  fontSize: TextSizeUtility
                                                      .textSize16,
                                                  color:
                                                      ColorUtility.color06C972),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : const Center(
                    child: Text("No Transaction Found"),
                  );
      }),
    );
  }
}
