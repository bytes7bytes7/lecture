// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResp _$ChangePasswordRespFromJson(Map<String, dynamic> json) =>
    ChangePasswordResp(
      access: json['access'] as String?,
      refresh: json['refresh'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$ChangePasswordRespToJson(ChangePasswordResp instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'access': instance.access,
      'refresh': instance.refresh,
    };
