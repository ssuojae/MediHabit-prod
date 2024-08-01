import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/login_event.freezed.dart';


@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.googleLoginRequested(BuildContext context) = GoogleLoginRequested;
}
