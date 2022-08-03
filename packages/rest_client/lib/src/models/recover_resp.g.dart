// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoverResp _$RecoverRespFromJson(Map<String, dynamic> json) => RecoverResp(
      sentEmail: json['sentEmail'] as bool?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$RecoverRespToJson(RecoverResp instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'sentEmail': instance.sentEmail,
    };
