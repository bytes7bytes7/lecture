import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;

part 'error_details.g.dart';

@JsonSerializable()
class ErrorDetails {
  const ErrorDetails({
    this.detail,
    this.login,
    this.password,
    this.firstName,
    this.lastName,
    this.code,
  });

  @JsonKey(name: const_api.detail)
  final String? detail;

  @JsonKey(name: const_api.login)
  final List<String>? login;

  @JsonKey(name: const_api.password)
  final List<String>? password;

  @JsonKey(name: const_api.firstName)
  final List<String>? firstName;

  @JsonKey(name: const_api.lastName)
  final List<String>? lastName;

  // TODO: add middleName?

  @JsonKey(name: const_api.code)
  final String? code;

  List<Object?> get values => [
    detail,
    login,
    password,
    firstName,
    lastName,
    code,
  ];

  factory ErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailsToJson(this);
}
