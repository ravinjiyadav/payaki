import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/auth/changePassword/change_password_request.dart';
import 'package:payaki/network/repository/auth_repository.dart';

class ChangePasswordScreenVm extends ChangeNotifier {
  final AuthRepository authRepository = AuthRepository();

  changePassword({
    required ValueChanged<String> onSuccess,
    required ValueChanged<String> onFailure,
    required ChangePasswordRequest request,
  }) {
    authRepository.changePass(request).then((value) {
      if (value.code == 200) {
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
