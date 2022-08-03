import 'package:json_annotation/json_annotation.dart';

part 'resp.g.dart';

@JsonSerializable()
class Resp {
  const Resp({this.detail});

  final String? detail;

  factory Resp.fromJson(Map<String, dynamic> json) => _$RespFromJson(json);

  Map<String, dynamic> toJson() => _$RespToJson(this);
}
