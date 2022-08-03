import 'package:json_annotation/json_annotation.dart';

import 'resp.dart';

part 'change_password_resp.g.dart';

@JsonSerializable()
class ChangePasswordResp extends Resp {
  const ChangePasswordResp({
    this.access,
    this.refresh,
    super.detail,
  });

  final String? access;
  final String? refresh;

  factory ChangePasswordResp.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChangePasswordRespToJson(this);
}
