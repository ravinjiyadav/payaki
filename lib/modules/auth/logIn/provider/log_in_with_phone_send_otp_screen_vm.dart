import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/loginSignup/login_with_phone_send_otp_request.dart';
import 'package:payaki/network/model/response/forgotPassword/forgot_pass_send_otp_response.dart';
import 'package:payaki/network/repository/auth_repository.dart';

class LoginWithPhoneSendOtpVm extends ChangeNotifier {
  final AuthRepository authRepository = AuthRepository();
  sendOtp({
    required ValueChanged<ForgotPassSendOtpResponse> onSuccess,
    required ValueChanged<String> onFailure,
    required LoginWithPhoneSendOtpRequest request,
  }) {
  // logD(request.toJson());
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
