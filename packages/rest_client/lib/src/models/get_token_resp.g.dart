// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenResp _$GetTokenRespFromJson(Map<String, dynamic> json) => GetTokenResp(
      token: json['token'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$GetTokenRespToJson(GetTokenResp instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'token': instance.token,
    };
