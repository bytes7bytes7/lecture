import 'package:json_annotation/json_annotation.dart';

import 'resp.dart';

part 'verify_token_resp.g.dart';

@JsonSerializable()
class VerifyTokenResp extends Resp {
  const VerifyTokenResp({
    super.error,
  });

  factory VerifyTokenResp.fromJson(Map<String, dynamic> json) =>
      _$VerifyTokenRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerifyTokenRespToJson(this);
}
