// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeResp _$VerifyCodeRespFromJson(Map<String, dynamic> json) =>
    VerifyCodeResp(
      verified: json['verified'] as bool?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$VerifyCodeRespToJson(VerifyCodeResp instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'verified': instance.verified,
    };
