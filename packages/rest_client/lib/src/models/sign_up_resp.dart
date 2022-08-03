import 'package:json_annotation/json_annotation.dart';

import 'resp.dart';

part 'sign_up_resp.g.dart';

@JsonSerializable()
class SignUpResp extends Resp {
  const SignUpResp({
    this.login,
    this.firstName,
    this.lastName,
    this.middleName,
    super.detail,
  });

  final String? login;
  final String? firstName;
  final String? lastName;
  final String? middleName;

  factory SignUpResp.fromJson(Map<String, dynamic> json) => _$SignUpRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignUpRespToJson(this);
}
