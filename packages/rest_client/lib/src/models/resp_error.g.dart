// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resp_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RespError _$RespErrorFromJson(Map<String, dynamic> json) => RespError(
      statusCode: json['status_code'] as int?,
      message: json['message'] as String?,
      details: (json['details'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$RespErrorToJson(RespError instance) => <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'details': instance.details,
    };
