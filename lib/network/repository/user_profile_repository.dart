import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/request/userProfile/resend_email_request.dart';
import 'package:payaki/network/model/request/userProfile/update_profile_request.dart';
import 'package:payaki/network/model/response/basic_response.dart';
import 'package:payaki/network/model/response/profile/country_list_response.dart';
import 'package:payaki/network/model/response/profile/transaction_list_response.dart';
import 'package:payaki/network/model/response/profile/user_profile_response.dart';

class UserProfileRepository {
  DioHttpService dioHttpService = DioHttpService();

  Future<UserProfileResponse> getUserDetail(BasicRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => UserProfileResponse.fromJson(value));
  }

  Future<BasicResponse> resendEmail(ResendEmailRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<CountryListResponse> getCountryList(BasicRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => CountryListResponse.fromJson(value));
  }

  Future<BasicResponse> updateProfile(
      UpdateProfileRequest request, XFile? image) async {
    MultipartFile? photo;
    if (image != null) {
      photo = await MultipartFile.fromFile(image.path, filename: image.name);
    }

    FormData formData =
        FormData.fromMap({"avatar": photo, ...request.toJson()});

    return dioHttpService
        .post(Endpoints.baseUrl, data: formData)
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<TransactionListResponse> getTransactionList(BasicRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => TransactionListResponse.fromJson(value));
  }


}
