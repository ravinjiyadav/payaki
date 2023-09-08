import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/reviewAndMail/add_review_request.dart';
import 'package:payaki/network/repository/review_repository.dart';

class AddReviewScreenVm extends ChangeNotifier {
  final ReviewRatingRepository reviewRatingRepository =
      ReviewRatingRepository();

  addReview({
    required ValueChanged<String> onSuccess,
    required ValueChanged<String> onFailure,
    required AddReviewRequest request,
  }) {
    logD(request.toJson());
    reviewRatingRepository.addReview(request).then((value) {
      if (value.code == 200) {
        onSuccess.call(value.message ?? "");
      } else {
        onFailure.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");

      onFailure.call(error.toString());
    });
  }
}
