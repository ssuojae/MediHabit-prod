import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';


@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.googleLoginRequested() = GoogleLoginRequested;
}
