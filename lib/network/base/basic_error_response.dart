import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_error_response.g.dart';

part 'basic_error_response.freezed.dart';

@freezed
class BasicErrorResponse with _$BasicErrorResponse {
  const BasicErrorResponse._();

  factory BasicErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicErrorResponseFromJson(json);

  const factory BasicErrorResponse({
    @JsonKey(name: "status") @Default(false) bool status,
    @JsonKey(name: "code") @Default(-1) int code,
    @JsonKey(name: "message") @Default("") String message,
    @JsonKey(name: "error") String? error,
    @JsonKey(name: "errors") dynamic errors,
  }) = _BasicErrorResponse;
}
