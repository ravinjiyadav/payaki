import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/base/basic_error_response.dart';
import 'package:payaki/network/client/http_service.dart';
import 'package:payaki/network/exception/app_exception.dart';
import 'package:payaki/network/interceptors/bearer_token_interceptor.dart';
import 'package:payaki/network/interceptors/loggy_dio_interceptor.dart';
import 'package:payaki/network/interceptors/retry_on_connection_change_interceptor.dart';

class DioHttpService implements HttpService {
  // static final DioHttpService _apiServiceInstance = DioHttpService();

  // static DioHttpService get apiServicesInstance => _apiServiceInstance;

//  String tokenBox = "dff";
  String tokenBox = Preference().getAccessToken();
  final String _baseUrl = "";

  final Dio dio = Dio();

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        //  baseUrl: "http://themindcrm.com/payaki-web/jwt-api/",
        headers: headers,
      );

  /// Creates new instance of [DioHttpService]
  DioHttpService() {
    Dio(baseOptions);

    dio.interceptors.add(LoggyDioInterceptor());
    dio.interceptors.add(BearerTokenInterceptor(tokenBox));
    dio.interceptors.add(RetryOnConnectionChangeInterceptor(dio: dio));
  }

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  }) async {
    return callApi(dio.get(path, queryParameters: queryParameters));
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return callApi(
      dio.post<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
      ),
    );
  }

  @override
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  }) {
    return callApi(dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
    ));
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return callApi(
      dio.put<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
      ),
    );
  }

  Future<dynamic> callApi(
    Future<Response<dynamic>> api,
  ) async {
    try {
      final response = await api;
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Future.value(response.data);
      } else {
        return Future.error(parseHttpException(response));
      }
    } on DioError catch (e) {
      return Future.error(parseDioError(e));
    }
  }

  // dynamic parseDioError(DioError error) {
  //   logD(
  //       "Parse Error => message =>${error.message}\n error =>${error.error} \n type=>${error.type}\n socket exception = ${error.error is SocketException}");
  //   switch (error.type) {
  //     case DioErrorType.connectionTimeout:
  //       return AppException.error("Connection Time out");
  //     case DioErrorType.sendTimeout:
  //       return AppException.error("Send Time out");
  //     case DioErrorType.receiveTimeout:
  //       return AppException.error("Receive Time out");
  //     case DioErrorType.cancel:
  //       return AppException.error("Request is Cancelled");
  //     case DioErrorType.badResponse:
  //       //   return BasicErrorResponse.fromJson(error.response!.data);
  //       return error.response!.data;
  //     case DioErrorType.unknown:
  //       if (error.error is SocketException) {
  //         return AppException.noInternet(requestOptions: error.requestOptions);
  //       }
  //       return AppException.error("Error Occurred!!");
  //     default:
  //       return AppException.error("Error Occurred!!");
  //   }
  // }

  dynamic parseDioError(DioError error) {
    logD(
        "Parse Error => message =>${error.message}\n error =>${error.error} \n type=>${error.type}\n socket exception = ${error.error is SocketException}");
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return AppException.error("Connection Time out");
      case DioErrorType.sendTimeout:
        return AppException.error("Send Time out");
      case DioErrorType.receiveTimeout:
        return AppException.error("Receive Time out");
      case DioErrorType.cancel:
        return AppException.error("Request is Cancelled");
      case DioErrorType.badResponse:
        return error.response!.statusMessage!;
      case DioErrorType.unknown:
        if (error.error is SocketException) {
          return AppException.noInternet(requestOptions: error.requestOptions);
        }
        return AppException.error("Error Occurred!!");
      default:
        return AppException.error("Error Occurred!!");
    }
  }


  dynamic parseHttpException(Response? response) {
    logD("parseHttpException $response");
    if (response == null) {
      return AppException.error("Error occurred!!");
    }
    switch (response.statusCode) {
      case 400:
        return AppException.error(response.data.toString());
      case 401:
      case 403:
        logD("message Navigate to login screen ");
        return AppException.error(response.data.toString());
      case 422:
        return response.data;
      case 500:
        return AppException.error(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      default:
        return response.data;
    }
  }
}