import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/response/profile/transaction_list_response.dart';
import 'package:payaki/network/repository/user_profile_repository.dart';

class TransactionScreenVm extends ChangeNotifier {
  final UserProfileRepository userProfileRepository = UserProfileRepository();
  TransactionListResponse? transactionListResponse;
    bool isLoading = true;

  getTransactionList({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    userProfileRepository
        .getTransactionList(BasicRequest(
            name: Endpoints.userProfileEndPoints.getTransactionListing, param: Param()))
        .then((value) {
      transactionListResponse = value;
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


}
