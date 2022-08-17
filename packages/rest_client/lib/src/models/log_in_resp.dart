import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;
import 'resp.dart';

part 'log_in_resp.g.dart';

@JsonSerializable()
class LogInResp extends Resp {
  const LogInResp({
    this.refresh,
    this.access,
    super.error,
  });

  @JsonKey(name: const_api.refresh)
  final String? refresh;

  @JsonKey(name: const_api.access)
  final String? access;

  factory LogInResp.fromJson(Map<String, dynamic> json) =>
      _$LogInRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LogInRespToJson(this);
}
