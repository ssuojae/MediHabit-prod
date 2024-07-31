import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/user.freezed.dart';
part '../../generated/user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    required String name,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
