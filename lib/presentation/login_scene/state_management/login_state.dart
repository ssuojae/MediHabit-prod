import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.freezed.dart';


@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    bool? isAuthenticated,
    User? user,
    String? error,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
        isLoading: false,
        isAuthenticated: false,
        user: null,
        error: null,
      );
}
