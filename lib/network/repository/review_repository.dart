import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/reviewAndMail/add_review_request.dart';
import 'package:payaki/network/model/request/reviewAndMail/quote_request.dart';
import 'package:payaki/network/model/request/reviewAndMail/reply_email_request.dart';
import 'package:payaki/network/model/request/reviewAndMail/report_ad_request.dart';
import 'package:payaki/network/model/response/basic_response.dart';

class ReviewRatingRepository {
  DioHttpService dioHttpService = DioHttpService();

  Future<BasicResponse> addReview(AddReviewRequest data) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: data.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<BasicResponse> replyEmail(ReplyEmailRequest data) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: data.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<BasicResponse> reportAd(ReportAdRequest data) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: data.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<BasicResponse> quoteSend(QuoteRequest data) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: data.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }
}
