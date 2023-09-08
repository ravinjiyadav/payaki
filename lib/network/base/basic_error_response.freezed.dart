// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasicErrorResponse _$BasicErrorResponseFromJson(Map<String, dynamic> json) {
  return _BasicErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$BasicErrorResponse {
  @JsonKey(name: "status")
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "error")
  String? get error => throw _privateConstructorUsedError;
  @JsonKey(name: "errors")
  dynamic get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicErrorResponseCopyWith<BasicErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicErrorResponseCopyWith<$Res> {
  factory $BasicErrorResponseCopyWith(
          BasicErrorResponse value, $Res Function(BasicErrorResponse) then) =
      _$BasicErrorResponseCopyWithImpl<$Res, BasicErrorResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool status,
      @JsonKey(name: "code") int code,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "error") String? error,
      @JsonKey(name: "errors") dynamic errors});
}

/// @nodoc
class _$BasicErrorResponseCopyWithImpl<$Res, $Val extends BasicErrorResponse>
    implements $BasicErrorResponseCopyWith<$Res> {
  _$BasicErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? error = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasicErrorResponseCopyWith<$Res>
    implements $BasicErrorResponseCopyWith<$Res> {
  factory _$$_BasicErrorResponseCopyWith(_$_BasicErrorResponse value,
          $Res Function(_$_BasicErrorResponse) then) =
      __$$_BasicErrorResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool status,
      @JsonKey(name: "code") int code,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "error") String? error,
      @JsonKey(name: "errors") dynamic errors});
}

/// @nodoc
class __$$_BasicErrorResponseCopyWithImpl<$Res>
    extends _$BasicErrorResponseCopyWithImpl<$Res, _$_BasicErrorResponse>
    implements _$$_BasicErrorResponseCopyWith<$Res> {
  __$$_BasicErrorResponseCopyWithImpl(
      _$_BasicErrorResponse _value, $Res Function(_$_BasicErrorResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? error = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$_BasicErrorResponse(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicErrorResponse extends _BasicErrorResponse {
  const _$_BasicErrorResponse(
      {@JsonKey(name: "status") this.status = false,
      @JsonKey(name: "code") this.code = -1,
      @JsonKey(name: "message") this.message = "",
      @JsonKey(name: "error") this.error,
      @JsonKey(name: "errors") this.errors})
      : super._();

  factory _$_BasicErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BasicErrorResponseFromJson(json);

  @override
  @JsonKey(name: "status")
  final bool status;
  @override
  @JsonKey(name: "code")
  final int code;
  @override
  @JsonKey(name: "message")
  final String message;
  @override
  @JsonKey(name: "error")
  final String? error;
  @override
  @JsonKey(name: "errors")
  final dynamic errors;

  @override
  String toString() {
    return 'BasicErrorResponse(status: $status, code: $code, message: $message, error: $error, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicErrorResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message, error,
      const DeepCollectionEquality().hash(errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicErrorResponseCopyWith<_$_BasicErrorResponse> get copyWith =>
      __$$_BasicErrorResponseCopyWithImpl<_$_BasicErrorResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicErrorResponseToJson(
      this,
    );
  }
}

abstract class _BasicErrorResponse extends BasicErrorResponse {
  const factory _BasicErrorResponse(
      {@JsonKey(name: "status") final bool status,
      @JsonKey(name: "code") final int code,
      @JsonKey(name: "message") final String message,
      @JsonKey(name: "error") final String? error,
      @JsonKey(name: "errors") final dynamic errors}) = _$_BasicErrorResponse;
  const _BasicErrorResponse._() : super._();

  factory _BasicErrorResponse.fromJson(Map<String, dynamic> json) =
      _$_BasicErrorResponse.fromJson;

  @override
  @JsonKey(name: "status")
  bool get status;
  @override
  @JsonKey(name: "code")
  int get code;
  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "error")
  String? get error;
  @override
  @JsonKey(name: "errors")
  dynamic get errors;
  @override
  @JsonKey(ignore: true)
  _$$_BasicErrorResponseCopyWith<_$_BasicErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
