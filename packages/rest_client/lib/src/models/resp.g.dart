// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resp _$RespFromJson(Map<String, dynamic> json) => Resp(
      error: json['error'] == null
          ? null
          : RespError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RespToJson(Resp instance) => <String, dynamic>{
      'error': instance.error,
    };
