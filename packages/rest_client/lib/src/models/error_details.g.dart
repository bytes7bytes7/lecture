// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) => ErrorDetails(
      detail: json['detail'] as String?,
      login:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
      password: (json['password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      firstName: (json['first_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastName: (json['last_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ErrorDetailsToJson(ErrorDetails instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'phone': instance.login,
      'password': instance.password,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'code': instance.code,
    };
