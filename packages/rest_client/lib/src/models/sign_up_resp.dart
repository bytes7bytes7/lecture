import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;
import 'resp.dart';

part 'sign_up_resp.g.dart';

@JsonSerializable()
class SignUpResp extends Resp {
  const SignUpResp({
    this.login,
    this.firstName,
    this.lastName,
    this.middleName,
    super.error,
  });

  @JsonKey(name: const_api.login)
  final String? login;

  @JsonKey(name: const_api.firstName)
  final String? firstName;

  @JsonKey(name: const_api.lastName)
  final String? lastName;

  @JsonKey(name: const_api.middleName)
  final String? middleName;

  factory SignUpResp.fromJson(Map<String, dynamic> json) =>
      _$SignUpRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignUpRespToJson(this);
}
