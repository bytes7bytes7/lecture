// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResp _$SignInRespFromJson(Map<String, dynamic> json) => SignInResp(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      error: json['error'] == null
          ? null
          : RespError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInRespToJson(SignInResp instance) =>
    <String, dynamic>{
      'error': instance.error,
      'refresh': instance.refresh,
      'access': instance.access,
    };
