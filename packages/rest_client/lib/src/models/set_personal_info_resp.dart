import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;
import 'resp.dart';

part 'set_personal_info_resp.g.dart';

@JsonSerializable()
class SetPersonalInfoResp extends Resp {
  const SetPersonalInfoResp({
    this.firstName,
    this.lastName,
    this.middleName,
    super.error,
  });

  @JsonKey(name: const_api.firstName)
  final String? firstName;

  @JsonKey(name: const_api.lastName)
  final String? lastName;

  @JsonKey(name: const_api.middleName)
  final String? middleName;


  factory SetPersonalInfoResp.fromJson(Map<String, dynamic> json) =>
      _$SetPersonalInfoRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SetPersonalInfoRespToJson(this);
}
