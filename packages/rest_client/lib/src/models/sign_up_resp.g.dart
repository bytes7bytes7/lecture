// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResp _$SignUpRespFromJson(Map<String, dynamic> json) => SignUpResp(
      login: json['login'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$SignUpRespToJson(SignUpResp instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'login': instance.login,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
    };
