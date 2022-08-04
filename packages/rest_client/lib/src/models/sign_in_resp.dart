import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;
import 'resp.dart';

part 'sign_in_resp.g.dart';

@JsonSerializable()
class SignInResp extends Resp {
  const SignInResp({
    this.refresh,
    this.access,
    super.error,
  });

  @JsonKey(name: const_api.refresh)
  final String? refresh;

  @JsonKey(name: const_api.access)
  final String? access;

  factory SignInResp.fromJson(Map<String, dynamic> json) =>
      _$SignInRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignInRespToJson(this);
}
