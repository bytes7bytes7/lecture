// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_personal_info_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPersonalInfoResp _$SetPersonalInfoRespFromJson(Map<String, dynamic> json) =>
    SetPersonalInfoResp(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$SetPersonalInfoRespToJson(
        SetPersonalInfoResp instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
    };
