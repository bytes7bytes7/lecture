import 'package:json_annotation/json_annotation.dart';

import 'resp.dart';

part 'recover_resp.g.dart';

@JsonSerializable()
class RecoverResp extends Resp {
  const RecoverResp({
    this.sentEmail,
    super.detail,
  });

  final bool? sentEmail;

  factory RecoverResp.fromJson(Map<String, dynamic> json) =>
      _$RecoverRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecoverRespToJson(this);
}
