// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoverResp _$RecoverRespFromJson(Map<String, dynamic> json) => RecoverResp(
      sentEmail: json['sent_email'] as bool?,
      error: json['error'] == null
          ? null
          : RespError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecoverRespToJson(RecoverResp instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'sent_email': instance.sentEmail,
    };
