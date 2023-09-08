// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasicErrorResponse _$$_BasicErrorResponseFromJson(
        Map<String, dynamic> json) =>
    _$_BasicErrorResponse(
      status: json['status'] as bool? ?? false,
      code: json['code'] as int? ?? -1,
      message: json['message'] as String? ?? "",
      error: json['error'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$$_BasicErrorResponseToJson(
        _$_BasicErrorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'error': instance.error,
      'errors': instance.errors,
    };
