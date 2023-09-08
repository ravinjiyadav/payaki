import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/postAdd/model/days_model.dart';
import 'package:payaki/modules/postAdd/provider/location_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';
import 'package:provider/provider.dart';

import '../../../network/model/response/location/city_list_response.dart';

class AddLocationScreen extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String title;
  final String tag;
  final String description;
  final String price;
  final int negotiate;
  final List<XFile> selectedImages; // List of selected image

  const AddLocationScreen(
      {Key? key,
      required this.catId,
      required this.subCatId,
      required this.title,
      required this.tag,
      required this.description,
      required this.price,
      required this.negotiate,
      required this.selectedImages})
      : super(key: key);

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  TextEditingController locationController = TextEditingController();

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  LocationVm locationVm = LocationVm();

  String? location;
  String? city;
  String? country;
  String? latlong;
  String? state;

  String? selectedLocation;
  TextEditingController phoneNumberController = TextEditingController();
  String? countryCode;

  Day? selectDayValue;

  @override
  void initState() {
    super.initState();
    locationVm = Provider.of<LocationVm>(context, listen: false);
    locationVm.cityListApi(
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
          child: Consumer<LocationVm>(builder: (context, locationVm, child) {
            return locationVm.isLoading == true
                ? const CircularProgressWidget()
                : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 23.h),
                              Text(
                                "Location",
                                style: StyleUtility.headingTextStyle,
                              ),
                              selectedLocation != null
                                  ? Text(
                                      selectedLocation ?? "",
                                      style: StyleUtility.headingTextStyle,
                                    )
                                  : const SizedBox(),
                              SizedBox(height: 25.h),
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
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.sp),
                                        child: Image.asset(
                                            ImageUtility.locationSelectIcon),
                                      ),
                                    ),
                                    focusColor: Colors.white,
                                  ),
                                ),
                                suggestionsCallback: (query) {
                                  if (locationController.text.isNotEmpty) {
                                    return locationVm.cityList!.where((obj) =>
                                        obj.name!
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

                                  locationVm.notifyListeners();
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                "Expire Ad",
                                style: StyleUtility.inputTextStyle,
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<Day>(
                                  isExpanded: true,
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
                                    "Select Expire Days",
                                    style: StyleUtility.hintTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  items: daysList
                                      .map((e) => DropdownMenuItem<Day>(
                                          value: e,
                                          child: Text(e.name,
                                              style:
                                                  StyleUtility.inputTextStyle)))
                                      .toList(),
                                  value: selectDayValue,
                                  onChanged: (Day? value) {
                                    selectDayValue = value!;
                                    logD(selectDayValue!.value);
                                  },
                                  icon: Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Image.asset(
                                      ImageUtility.dropDownIcon,
                                      width: 14.w,
                                    ),
                                  ),
                                  iconSize: 20.sp,
                                  iconEnabledColor: Colors.black,
                                  iconDisabledColor: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              MobileNumberTextField(
                                  controller: phoneNumberController,
                                  onChanged: (phone) {
                                    countryCode = phone.countryCode;
                                  }),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                          buttonText: "Next",
                          onTab: () {
                            FocusScope.of(context).unfocus();
                            logD("Selected location $location");
                            // if (locationController.text.isEmpty) {
                            if (location == null) {
                              context.flushBarTopErrorMessage(
                                  message: "Please Select Location.");
                            } else if (selectDayValue?.value == null) {
                              context.flushBarTopErrorMessage(
                                  message: "Please Select Expire Days.");
                            } else if (phoneNumberController.text.isEmpty) {
                              context.flushBarTopErrorMessage(
                                  message: "Please Enter Mobile Number.");
                            } else {
                              Navigator.pushNamed(
                                  context, RouteName.selectAddTypeScreen,
                                  arguments: {
                                    "catId": widget.catId,
                                    "subCatId": widget.subCatId,
                                    "title": widget.title,
                                    "tag": widget.tag,
                                    "description": widget.description,
                                    "price": widget.price,
                                    "negotiate": widget.negotiate,
                                    "selectedImages": widget.selectedImages,
                                    "location": location,
                                    "city": city,
                                    "country": country,
                                    "latlong": latlong,
                                    "state": state,
                                    "phone": phoneNumberController.text,
                                    "availableDays": selectDayValue?.value,
                                    // "location": "Subh Sampada Colony Nipania",
                                    // "city": "Indore",
                                    // "country": "IN",
                                    // "latlong": "22.87557556,72.4664465",
                                    // "state": "IN.35",
                                  });
                            }
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
