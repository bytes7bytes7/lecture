// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_token_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyTokenResp _$VerifyTokenRespFromJson(Map<String, dynamic> json) =>
    VerifyTokenResp(
      error: json['error'] == null
          ? null
          : RespError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyTokenRespToJson(VerifyTokenResp instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
    };
