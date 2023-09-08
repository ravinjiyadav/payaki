import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/request/userProfile/resend_email_request.dart'
    as resend_email;
import 'package:payaki/network/model/response/profile/user_profile_response.dart';
import 'package:payaki/network/repository/user_profile_repository.dart';

class ProfileScreenVm extends ChangeNotifier {
  final UserProfileRepository userProfileRepository = UserProfileRepository();

  UserProfileResponse? userProfileResponse;
  bool isLoading = true;

  getUserDetail({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    userProfileRepository
        .getUserDetail(BasicRequest(
            name: Endpoints.userProfileEndPoints.viewProfile, param: Param()))
        .then((value) {
      userProfileResponse = value;
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

  resendEmail({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    String? email,
  }) {
    userProfileRepository
        .resendEmail(resend_email.ResendEmailRequest(
            name: Endpoints.userProfileEndPoints.resendConfirmationEmail,
            param: resend_email.Param(email: email)))
        .then((value) {
      notifyListeners();

      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }
}
