import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/request/userProfile/update_profile_request.dart';
import 'package:payaki/network/model/response/profile/country_list_response.dart';
import 'package:payaki/network/repository/user_profile_repository.dart';

class EditProfileScreenVm extends ChangeNotifier {
  final UserProfileRepository userProfileRepository = UserProfileRepository();

  List<Data>? countryList;
  bool isLoading = true;

  getCountryList({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    userProfileRepository
        .getCountryList(BasicRequest(
            name: Endpoints.userProfileEndPoints.getCountries,
        param: Param()))
        .then((value) {
      countryList = value.data;
      isLoading = false;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("Error $error");
      isLoading = false;
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }

  updateProfile(
      {ValueChanged<String>? onSuccess,
      ValueChanged<String>? onFailure,
      required UpdateProfileRequest request,
      XFile? photo}) async {
    userProfileRepository.updateProfile(request, photo).then((value) {
      notifyListeners();

      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();

      onFailure?.call("Server Error");
    });
  }
}

