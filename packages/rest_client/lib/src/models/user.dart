import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;
import '../extensions/iterable_ext.dart';

part 'user.g.dart';

extension UserExt on User {
  String getFio() {
    final buffer = StringBuffer()..write(lastName);

    final firName = firstName.split('').firstOrNull;
    if (firName != null) {
      buffer.write(' $firName.');
    }

    final midName = middleName?.split('').firstOrNull;
    if (midName != null) {
      buffer.write(' $midName.');
    }

    return buffer.toString();
  }
}

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.middleName,
    this.token,
    this.avatar,
    this.bookmarks,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? middleName;
  final String? token;
  final String? avatar;
  final List<String>? bookmarks;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String get beautifulID =>
      'id${id.toString().padLeft(const_api.idLength, '0')}';
}
