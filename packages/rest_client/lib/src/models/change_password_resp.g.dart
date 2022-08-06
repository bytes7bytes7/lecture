// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResp _$ChangePasswordRespFromJson(Map<String, dynamic> json) =>
    ChangePasswordResp(
      access: json['access'] as String?,
      refresh: json['refresh'] as String?,
      error: json['error'] == null
          ? null
          : RespError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChangePasswordRespToJson(ChangePasswordResp instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'access': instance.access,
      'refresh': instance.refresh,
    };
