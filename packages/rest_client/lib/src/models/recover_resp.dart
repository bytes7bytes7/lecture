import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;
import 'resp.dart';

part 'recover_resp.g.dart';

@JsonSerializable()
class RecoverResp extends Resp {
  const RecoverResp({
    this.sentEmail,
    super.error,
  });

  @JsonKey(name: const_api.sentEmail)
  final bool? sentEmail;

  factory RecoverResp.fromJson(Map<String, dynamic> json) =>
      _$RecoverRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecoverRespToJson(this);
}
