// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleLoginRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? googleLoginRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleLoginRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleLoginRequested value) googleLoginRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleLoginRequested value)? googleLoginRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleLoginRequested value)? googleLoginRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GoogleLoginRequestedImplCopyWith<$Res> {
  factory _$$GoogleLoginRequestedImplCopyWith(_$GoogleLoginRequestedImpl value,
          $Res Function(_$GoogleLoginRequestedImpl) then) =
      __$$GoogleLoginRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLoginRequestedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$GoogleLoginRequestedImpl>
    implements _$$GoogleLoginRequestedImplCopyWith<$Res> {
  __$$GoogleLoginRequestedImplCopyWithImpl(_$GoogleLoginRequestedImpl _value,
      $Res Function(_$GoogleLoginRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleLoginRequestedImpl implements GoogleLoginRequested {
  const _$GoogleLoginRequestedImpl();

  @override
  String toString() {
    return 'LoginEvent.googleLoginRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleLoginRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleLoginRequested,
  }) {
    return googleLoginRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? googleLoginRequested,
  }) {
    return googleLoginRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleLoginRequested,
    required TResult orElse(),
  }) {
    if (googleLoginRequested != null) {
      return googleLoginRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleLoginRequested value) googleLoginRequested,
  }) {
    return googleLoginRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleLoginRequested value)? googleLoginRequested,
  }) {
    return googleLoginRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleLoginRequested value)? googleLoginRequested,
    required TResult orElse(),
  }) {
    if (googleLoginRequested != null) {
      return googleLoginRequested(this);
    }
    return orElse();
  }
}

abstract class GoogleLoginRequested implements LoginEvent {
  const factory GoogleLoginRequested() = _$GoogleLoginRequestedImpl;
}
