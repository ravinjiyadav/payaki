import 'package:flutter/cupertino.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/loginSignup/login_with_phone_send_otp_request.dart';
import 'package:payaki/network/model/request/loginSignup/login_with_phone_verify_otp_request.dart';
import 'package:payaki/network/model/response/forgotPassword/forgot_pass_send_otp_response.dart';
import 'package:payaki/network/repository/auth_repository.dart';

class LoginWithPhoneVerifyOtpVm extends ChangeNotifier {
  final AuthRepository authRepository = AuthRepository();

  verifyOtp({
    required ValueChanged<String> onSuccess,
    required ValueChanged<String> onFailure,
    required LoginWithPhoneVerifyOtpRequest request,
  }) {
    authRepository.loginWithPhoneVerifyOtp(request).then((value) {
      if (value.code == 200) {
        Preference.setUserId(value.data?.id);
        Preference.setAccessToken(value.token ?? "");

        Preference.setUserLogin(true);

        Preference.setUserName(value.data?.username ?? "");
        Preference.setName(value.data?.name ?? "");
        Preference.setUserEmail(value.data?.email ?? "");
        Preference.setUserChatUrl(value.data?.chatUrl ?? "");


        onSuccess.call(value.message ?? "");
      } else {
        onFailure.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      onFailure.call("Server Error");
    });
  }

  sendOtp({
    required ValueChanged<ForgotPassSendOtpResponse> onSuccess,
    required ValueChanged<String> onFailure,
    required LoginWithPhoneSendOtpRequest request,
  }) {
    authRepository.loginWithPhoneSendOtp(request).then((value) {
      if (value.code == 200) {
        onSuccess.call(value);
      } else {
        onFailure.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");

      onFailure.call("Server Error");
    });
  }


}
