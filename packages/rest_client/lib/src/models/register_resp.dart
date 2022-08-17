import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;
import 'resp.dart';

part 'register_resp.g.dart';

@JsonSerializable()
class RegisterResp extends Resp {
  const RegisterResp({
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

  factory RegisterResp.fromJson(Map<String, dynamic> json) =>
      _$RegisterRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterRespToJson(this);
}
