// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeResp _$VerifyCodeRespFromJson(Map<String, dynamic> json) =>
    VerifyCodeResp(
      verified: json['verified'] as bool?,
      error: json['error'] == null
          ? null
          : RespError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyCodeRespToJson(VerifyCodeResp instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'verified': instance.verified,
    };
