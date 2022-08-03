import 'package:json_annotation/json_annotation.dart';

import 'resp.dart';

part 'sign_in_resp.g.dart';

@JsonSerializable()
class SignInResp extends Resp {
  const SignInResp({
    this.refresh,
    this.access,
    super.detail,
  });

  final String? refresh;
  final String? access;

  factory SignInResp.fromJson(Map<String, dynamic> json) =>
      _$SignInRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignInRespToJson(this);
}
