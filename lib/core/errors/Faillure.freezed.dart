// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Faillure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Faillure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() offlineError,
    required TResult Function() invalidData,
    required TResult Function(String message) wrongPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? offlineError,
    TResult? Function()? invalidData,
    TResult? Function(String message)? wrongPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? offlineError,
    TResult Function()? invalidData,
    TResult Function(String message)? wrongPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_OfflineError value) offlineError,
    required TResult Function(_InvalidData value) invalidData,
    required TResult Function(_WrongPassword value) wrongPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_OfflineError value)? offlineError,
    TResult? Function(_InvalidData value)? invalidData,
    TResult? Function(_WrongPassword value)? wrongPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_OfflineError value)? offlineError,
    TResult Function(_InvalidData value)? invalidData,
    TResult Function(_WrongPassword value)? wrongPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaillureCopyWith<$Res> {
  factory $FaillureCopyWith(Faillure value, $Res Function(Faillure) then) =
      _$FaillureCopyWithImpl<$Res, Faillure>;
}

/// @nodoc
class _$FaillureCopyWithImpl<$Res, $Val extends Faillure>
    implements $FaillureCopyWith<$Res> {
  _$FaillureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Faillure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$FaillureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Faillure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl implements _ServerError {
  const _$ServerErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Faillure.serverError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Faillure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() offlineError,
    required TResult Function() invalidData,
    required TResult Function(String message) wrongPassword,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? offlineError,
    TResult? Function()? invalidData,
    TResult? Function(String message)? wrongPassword,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? offlineError,
    TResult Function()? invalidData,
    TResult Function(String message)? wrongPassword,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_OfflineError value) offlineError,
    required TResult Function(_InvalidData value) invalidData,
    required TResult Function(_WrongPassword value) wrongPassword,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_OfflineError value)? offlineError,
    TResult? Function(_InvalidData value)? invalidData,
    TResult? Function(_WrongPassword value)? wrongPassword,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_OfflineError value)? offlineError,
    TResult Function(_InvalidData value)? invalidData,
    TResult Function(_WrongPassword value)? wrongPassword,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements Faillure {
  const factory _ServerError({required final String message}) =
      _$ServerErrorImpl;

  String get message;

  /// Create a copy of Faillure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OfflineErrorImplCopyWith<$Res> {
  factory _$$OfflineErrorImplCopyWith(
          _$OfflineErrorImpl value, $Res Function(_$OfflineErrorImpl) then) =
      __$$OfflineErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OfflineErrorImplCopyWithImpl<$Res>
    extends _$FaillureCopyWithImpl<$Res, _$OfflineErrorImpl>
    implements _$$OfflineErrorImplCopyWith<$Res> {
  __$$OfflineErrorImplCopyWithImpl(
      _$OfflineErrorImpl _value, $Res Function(_$OfflineErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Faillure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OfflineErrorImpl implements _OfflineError {
  const _$OfflineErrorImpl();

  @override
  String toString() {
    return 'Faillure.offlineError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OfflineErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() offlineError,
    required TResult Function() invalidData,
    required TResult Function(String message) wrongPassword,
  }) {
    return offlineError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? offlineError,
    TResult? Function()? invalidData,
    TResult? Function(String message)? wrongPassword,
  }) {
    return offlineError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? offlineError,
    TResult Function()? invalidData,
    TResult Function(String message)? wrongPassword,
    required TResult orElse(),
  }) {
    if (offlineError != null) {
      return offlineError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_OfflineError value) offlineError,
    required TResult Function(_InvalidData value) invalidData,
    required TResult Function(_WrongPassword value) wrongPassword,
  }) {
    return offlineError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_OfflineError value)? offlineError,
    TResult? Function(_InvalidData value)? invalidData,
    TResult? Function(_WrongPassword value)? wrongPassword,
  }) {
    return offlineError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_OfflineError value)? offlineError,
    TResult Function(_InvalidData value)? invalidData,
    TResult Function(_WrongPassword value)? wrongPassword,
    required TResult orElse(),
  }) {
    if (offlineError != null) {
      return offlineError(this);
    }
    return orElse();
  }
}

abstract class _OfflineError implements Faillure {
  const factory _OfflineError() = _$OfflineErrorImpl;
}

/// @nodoc
abstract class _$$InvalidDataImplCopyWith<$Res> {
  factory _$$InvalidDataImplCopyWith(
          _$InvalidDataImpl value, $Res Function(_$InvalidDataImpl) then) =
      __$$InvalidDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidDataImplCopyWithImpl<$Res>
    extends _$FaillureCopyWithImpl<$Res, _$InvalidDataImpl>
    implements _$$InvalidDataImplCopyWith<$Res> {
  __$$InvalidDataImplCopyWithImpl(
      _$InvalidDataImpl _value, $Res Function(_$InvalidDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Faillure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InvalidDataImpl implements _InvalidData {
  const _$InvalidDataImpl();

  @override
  String toString() {
    return 'Faillure.invalidData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() offlineError,
    required TResult Function() invalidData,
    required TResult Function(String message) wrongPassword,
  }) {
    return invalidData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? offlineError,
    TResult? Function()? invalidData,
    TResult? Function(String message)? wrongPassword,
  }) {
    return invalidData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? offlineError,
    TResult Function()? invalidData,
    TResult Function(String message)? wrongPassword,
    required TResult orElse(),
  }) {
    if (invalidData != null) {
      return invalidData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_OfflineError value) offlineError,
    required TResult Function(_InvalidData value) invalidData,
    required TResult Function(_WrongPassword value) wrongPassword,
  }) {
    return invalidData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_OfflineError value)? offlineError,
    TResult? Function(_InvalidData value)? invalidData,
    TResult? Function(_WrongPassword value)? wrongPassword,
  }) {
    return invalidData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_OfflineError value)? offlineError,
    TResult Function(_InvalidData value)? invalidData,
    TResult Function(_WrongPassword value)? wrongPassword,
    required TResult orElse(),
  }) {
    if (invalidData != null) {
      return invalidData(this);
    }
    return orElse();
  }
}

abstract class _InvalidData implements Faillure {
  const factory _InvalidData() = _$InvalidDataImpl;
}

/// @nodoc
abstract class _$$WrongPasswordImplCopyWith<$Res> {
  factory _$$WrongPasswordImplCopyWith(
          _$WrongPasswordImpl value, $Res Function(_$WrongPasswordImpl) then) =
      __$$WrongPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$WrongPasswordImplCopyWithImpl<$Res>
    extends _$FaillureCopyWithImpl<$Res, _$WrongPasswordImpl>
    implements _$$WrongPasswordImplCopyWith<$Res> {
  __$$WrongPasswordImplCopyWithImpl(
      _$WrongPasswordImpl _value, $Res Function(_$WrongPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of Faillure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$WrongPasswordImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WrongPasswordImpl implements _WrongPassword {
  const _$WrongPasswordImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Faillure.wrongPassword(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongPasswordImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Faillure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WrongPasswordImplCopyWith<_$WrongPasswordImpl> get copyWith =>
      __$$WrongPasswordImplCopyWithImpl<_$WrongPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() offlineError,
    required TResult Function() invalidData,
    required TResult Function(String message) wrongPassword,
  }) {
    return wrongPassword(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? offlineError,
    TResult? Function()? invalidData,
    TResult? Function(String message)? wrongPassword,
  }) {
    return wrongPassword?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? offlineError,
    TResult Function()? invalidData,
    TResult Function(String message)? wrongPassword,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_OfflineError value) offlineError,
    required TResult Function(_InvalidData value) invalidData,
    required TResult Function(_WrongPassword value) wrongPassword,
  }) {
    return wrongPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_OfflineError value)? offlineError,
    TResult? Function(_InvalidData value)? invalidData,
    TResult? Function(_WrongPassword value)? wrongPassword,
  }) {
    return wrongPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_OfflineError value)? offlineError,
    TResult Function(_InvalidData value)? invalidData,
    TResult Function(_WrongPassword value)? wrongPassword,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword(this);
    }
    return orElse();
  }
}

abstract class _WrongPassword implements Faillure {
  const factory _WrongPassword({required final String message}) =
      _$WrongPasswordImpl;

  String get message;

  /// Create a copy of Faillure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WrongPasswordImplCopyWith<_$WrongPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
