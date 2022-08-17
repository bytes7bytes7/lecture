// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInResp _$LogInRespFromJson(Map<String, dynamic> json) => LogInResp(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      error: json['error'] == null
          ? null
          : RespError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogInRespToJson(LogInResp instance) => <String, dynamic>{
      'error': instance.error?.toJson(),
      'refresh': instance.refresh,
      'access': instance.access,
    };
