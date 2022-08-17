import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;
import 'error_details.dart';

part 'resp_error.g.dart';

@JsonSerializable()
class RespError {
  const RespError({
    this.statusCode,
    this.message,
    this.details,
  });

  @JsonKey(name: const_api.statusCode)
  final int? statusCode;

  @JsonKey(name: const_api.message)
  final String? message;

  @JsonKey(name: const_api.details)
  final ErrorDetails? details;

  factory RespError.fromJson(Map<String, dynamic> json) =>
      _$RespErrorFromJson(json);

  Map<String, dynamic> toJson() => _$RespErrorToJson(this);
}
