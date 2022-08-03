// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResp _$SignInRespFromJson(Map<String, dynamic> json) => SignInResp(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$SignInRespToJson(SignInResp instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'refresh': instance.refresh,
      'access': instance.access,
    };
