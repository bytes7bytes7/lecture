// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String?,
      middleName: json['middleName'] as String?,
      token: json['token'] as String?,
      avatar: json['avatar'] as String?,
      bookmarks:
          (json['bookmarks'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'middleName': instance.middleName,
      'token': instance.token,
      'avatar': instance.avatar,
      'bookmarks': instance.bookmarks,
    };
