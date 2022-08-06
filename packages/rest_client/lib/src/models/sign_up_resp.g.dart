// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResp _$SignUpRespFromJson(Map<String, dynamic> json) => SignUpResp(
      login: json['phone'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middleName: json['middle_name'] as String?,
      error: json['error'] == null
          ? null
          : RespError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpRespToJson(SignUpResp instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'phone': instance.login,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middle_name': instance.middleName,
    };
