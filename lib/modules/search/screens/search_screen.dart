import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/search/providers/search_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';
import '../../../network/model/response/category/category_list_response.dart'
    as category;
import '../../../network/model/response/location/city_list_response.dart';
import 'package:payaki/network/model/request/search/search_request.dart'
    as s_request;

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController locationController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  SearchScreenVm searchScreenVm = SearchScreenVm();

  String? location;
  String? city;
  String? country;
  String? latlong;
  String? state;

  String? selectedLocation;

  category.Data? selectedCategory;

  @override
  void initState() {
    super.initState();
    searchScreenVm = Provider.of<SearchScreenVm>(context, listen: false);
    searchScreenVm.cityListApi(onSuccess: (value) {}, onFailure: (value) {});
    searchScreenVm.categoryListApi(
        onSuccess: (value) {},
        onFailure: (String message) {
          context.flushBarTopErrorMessage(message: message);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Search",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Consumer<SearchScreenVm>(
                      builder: (context, searchScreenVm, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 23.h),
                        Text(
                          "Category",
                          style: StyleUtility.inputTextStyle,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<category.Data>(
                            isExpanded: false,

                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: 15.sp,
                                  bottom: 15.sp,
                                  left: 20.w,
                                  right: 5.w),
                              filled: true,
                              fillColor: ColorUtility.colorF8FAFB,
                              hintStyle: StyleUtility.hintTextStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              focusColor: ColorUtility.whiteColor,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                            hint: Text(
                              "Select Category",
                              style: StyleUtility.hintTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: searchScreenVm.categoryList
                                ?.map((item) => DropdownMenuItem<category.Data>(
                                      value: item,
                                      child: Text(
                                        item.catName!,
                                        style: StyleUtility.inputTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: selectedCategory,
                            onChanged: (value) {
                              selectedCategory = value;
                              searchScreenVm.notifyListeners();
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Image.asset(
                                ImageUtility.dropDownIcon,
                                width: 14.w,
                              ),
                            ),

                            //  offset: const Offset(-20, 0),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SimpleTextField(
                          controller: titleController,
                          hintText: "Title",
                          titleText: "Title *",
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Add Location",
                          style: StyleUtility.inputTextStyle,
                        ),
                        TypeAheadField<Data>(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: locationController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: 12.sp,
                                  bottom: 12.sp,
                                  left: 20.w,
                                  right: 5.w),
                              filled: true,
                              hintText: "Enter Location",
                              fillColor: ColorUtility.colorF8FAFB,
                              hintStyle: StyleUtility.hintTextStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: ColorUtility.colorE2E5EF,
                                ),
                              ),
                              prefixIcon: SizedBox(
                                height: 55.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 20.sp),
                                  child: Image.asset(
                                      ImageUtility.locationSelectIcon),
                                ),
                              ),
                              focusColor: Colors.white,
                            ),
                          ),
                          suggestionsCallback: (query) {
                            if (locationController.text.isEmpty) {
                              location = null;
                              city = null;
                              country = null;
                              state = null;
                              selectedLocation = null;
                              searchScreenVm.updateUi();
                            }

                            if (locationController.text.isNotEmpty) {
                              return searchScreenVm.cityList!.where((obj) => obj
                                  .name!
                                  .toLowerCase()
                                  .contains(query.toLowerCase()));
                            }

                            return [];
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion.name!),
                              subtitle: Text(suggestion.stateName!),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            // Do something with the selected suggestion

                            location = suggestion.name;
                            city = suggestion.id;
                            country = suggestion.countryCode;
                            latlong =
                                "${suggestion.latitude},${suggestion.longitude}";
                            state = suggestion.subadmin1Code;

                            locationController.text =
                                "${suggestion.name!},${suggestion.stateName!}";
                            selectedLocation =
                                "${suggestion.name!},${suggestion.stateName!}";

                            searchScreenVm.notifyListeners();
                          },
                        ),
                        selectedLocation != null
                            ? Text(
                                selectedLocation ?? "",
                                style: StyleUtility.inputTextStyle,
                              )
                            : const SizedBox(),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    );
                  }),
                ),
              ),
              CustomButton(
                  buttonText: "Search",
                  onTab: () {
                    logD("Selected location $location");
                    // if (locationController.text.isEmpty) {
                    if (titleController.text.isEmpty &&
                        location == null &&
                        selectedCategory == null) {
                      context.flushBarTopErrorMessage(
                          message: "Please Fill Up At Least One Field.");
                    } else {
                      CommonDialog.showLoadingDialog(context);
                      searchScreenVm.searchPostApi(
                          searchRequest: s_request.SearchRequest(
                              name: Endpoints.search.getAllPost,
                              param: s_request.Param(
                                title: titleController.text,
                                category: selectedCategory?.catId,
                                location: location,
                                city: city,
                                country: country,
                                state: state,
                              )),
                          onSuccess: (searchPostList) {
                            Navigator.pop(context);

                            Navigator.pushNamed(
                                context, RouteName.searchResultScreen,
                                arguments: {
                                  "initialPostList": searchPostList,
                                  "headerTitle": "Search Result",
                                  "title": titleController.text,
                                  "category": selectedCategory?.catId,
                                  "location": location,
                                  "city": city,
                                  "country": country,
                                  "state": state,
                                });
                          },
                          onFailure: (value) {
                            Navigator.pop(context);
                            context.flushBarTopErrorMessage(message: value);
                          });
                    }
                  }),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
