import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/reviewAndMail/reply_email_request.dart';
import 'package:payaki/network/repository/review_repository.dart';

class ReplyEmailScreenVm extends ChangeNotifier {
  final ReviewRatingRepository reviewRatingRepository =
  ReviewRatingRepository();

 replyEmail({
    required ValueChanged<String> onSuccess,
    required ValueChanged<String> onFailure,
    required ReplyEmailRequest request,
  }) {
    logD(request.toJson());
    reviewRatingRepository.replyEmail(request).then((value) {
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
