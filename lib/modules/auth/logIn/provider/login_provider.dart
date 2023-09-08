import 'package:flutter/cupertino.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/loginSignup/login_request.dart';
import 'package:payaki/network/model/request/loginSignup/social_login_request.dart';
import 'package:payaki/network/repository/auth_repository.dart';

class LogInProvider extends ChangeNotifier {
  final AuthRepository authRepository = AuthRepository();

  loginApi({
    required ValueChanged<String> onSuccess,
    required ValueChanged<String> onFailure,
    required LogInRequest request,
  }) {
    authRepository.logIn(request).then((value) {
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

  socialLoginApi({
    required ValueChanged<String> onSuccess,
    required ValueChanged<String> onFailure,
    required SocialLoginRequest request,
  }) {

    logD("request is ${request.toJson()}");
    authRepository.socialLogIn(request).then((value) {
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





}
