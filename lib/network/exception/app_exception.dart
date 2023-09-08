import 'package:dio/dio.dart';

class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix$_message";
  }

  factory AppException.error(String message) = ApiErrorException;

  factory AppException.notifyEmpty(String message) = ApiEmptyException;

  factory AppException.noInternet({RequestOptions? requestOptions}) =
      NoInternetException;
}

class NoInternetException extends AppException {
  RequestOptions? requestOptions;

  NoInternetException({this.requestOptions})
      : super("No Internet connection", "Error: ");
}

class ApiEmptyException extends AppException {
  ApiEmptyException(String message) : super(message, "Empty Exception : ");
}

class ApiErrorException extends AppException {
  ApiErrorException(String message) : super(message, "Api Error : ");
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException(String message) : super(message, "Invalid Input: ");
}
