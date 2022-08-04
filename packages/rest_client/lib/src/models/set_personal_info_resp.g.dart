// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_personal_info_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPersonalInfoResp _$SetPersonalInfoRespFromJson(Map<String, dynamic> json) =>
    SetPersonalInfoResp(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middleName: json['middle_name'] as String?,
      error: json['error'] == null
          ? null
          : RespError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetPersonalInfoRespToJson(
        SetPersonalInfoResp instance) =>
    <String, dynamic>{
      'error': instance.error,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middle_name': instance.middleName,
    };
