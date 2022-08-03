import 'package:json_annotation/json_annotation.dart';

import 'resp.dart';

part 'get_token_resp.g.dart';

@JsonSerializable()
class GetTokenResp extends Resp {
  const GetTokenResp({
    this.token,
    super.detail,
  });

  final String? token;

  factory GetTokenResp.fromJson(Map<String, dynamic> json) =>
      _$GetTokenRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetTokenRespToJson(this);
}
