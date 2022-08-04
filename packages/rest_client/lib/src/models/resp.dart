import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;
import 'resp_error.dart';

export 'resp_error.dart';

part 'resp.g.dart';

@JsonSerializable()
class Resp {
  const Resp({this.error});

  @JsonKey(name: const_api.error)
  final RespError? error;

  factory Resp.fromJson(Map<String, dynamic> json) => _$RespFromJson(json);

  Map<String, dynamic> toJson() => _$RespToJson(this);
}
