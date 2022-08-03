import 'package:json_annotation/json_annotation.dart';

import 'resp.dart';

part 'set_personal_info_resp.g.dart';

@JsonSerializable()
class SetPersonalInfoResp extends Resp {
  const SetPersonalInfoResp({
    this.firstName,
    this.lastName,
    this.middleName,
    super.detail,
  });

  final String? firstName;
  final String? lastName;
  final String? middleName;

  factory SetPersonalInfoResp.fromJson(Map<String, dynamic> json) =>
      _$SetPersonalInfoRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SetPersonalInfoRespToJson(this);
}
