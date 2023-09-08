// import 'package:payaki/network/base/basic_error_response.dart';
//
// class ErrorParser {
//   ErrorParser._();
//
//   static ParsedError parse(dynamic errorResponse) {
//     if (errorResponse is BasicErrorResponse) {
//       if (errorResponse.error != null) {
//         return ParsedError(message: errorResponse.error.toString());
//       } else if (errorResponse.errors != null &&
//           errorResponse.errors is Map<String, dynamic>) {
//         final errorMap = errorResponse.errors as Map<String, dynamic>;
//         List<ParsedErrorMessage> messages = [];
//         errorMap.forEach((key, value) {
//           if (value is List) {
//             messages.add(ParsedErrorMessage(key: key, message: value[0]));
//           } else {
//             messages
//                 .add(ParsedErrorMessage(key: key, message: value.toString()));
//           }
//         });
//         return ParsedError(errorMessages: messages);
//       } else if (errorResponse.errors != null &&
//           errorResponse.errors is String) {
//         return ParsedError(message: errorResponse.errors.toString());
//       } else if (errorResponse.message != null &&
//           errorResponse.message!.isNotEmpty) {
//         return ParsedError(message: errorResponse.message!);
//       } else {
//         return ParsedError(message: "Error Occurred!! Nothing to parse");
//       }
//     } else if (errorResponse is BasicErrorResponse) {
//       return ParsedError(message: errorResponse.message ?? "");
//     } else {
//       return ParsedError(message: errorResponse.toString());
//     }
//   }
//
//   static String parseAsSingleMessage(dynamic error) {
//     final parsedError = ErrorParser.parse(error);
//     if (parsedError.errorMessages.isNotEmpty) {
//       return parsedError.errorMessages[0].message;
//     } else {
//       return parsedError.message;
//     }
//   }
//
//   static int parseStatusCode(dynamic error) {
//     if (error is BasicErrorResponse) {
//       return error.code;
//     } else {
//       return -1;
//     }
//   }
// }
//
// class ParsedError {
//   String message;
//   List<ParsedErrorMessage> errorMessages;
//
//   ParsedError({this.message = "", this.errorMessages = const []});
// }
//
// class ParsedErrorMessage {
//   String key;
//   String message;
//
//   ParsedErrorMessage({required this.key, required this.message});
// }
