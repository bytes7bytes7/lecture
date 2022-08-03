import 'package:json_annotation/json_annotation.dart';

import 'resp.dart';

part 'verify_code_resp.g.dart';

@JsonSerializable()
class VerifyCodeResp extends Resp {
  const VerifyCodeResp({
    this.verified,
    super.detail,
  });

  final bool? verified;

  factory VerifyCodeResp.fromJson(Map<String, dynamic> json) => _$VerifyCodeRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerifyCodeRespToJson(this);
}
