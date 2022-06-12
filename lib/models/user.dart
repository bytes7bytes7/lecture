import '../constants/api.dart' as const_api;
import '../constants/app.dart' as const_app;
import '../custom/iterable_ext.dart';

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

class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.middleName,
    this.avatar,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String? middleName;
  final String? avatar;

  static User fromMap(Map<String, Object?> map) {
    final id = map[const_api.id];
    final firstName = map[const_api.firstName];
    final lastName = map[const_api.lastName];
    final middleName = map[const_api.middleName];
    final avatar = map[const_api.avatar];

    return User(
      id: (id is String) ? id : const_app.unknownStr,
      firstName: (firstName is String) ? firstName : const_app.unknownStr,
      lastName: (lastName is String) ? lastName : const_app.unknownStr,
      middleName: (middleName is String) ? middleName : null,
      avatar: (avatar is String) ? avatar : null,
    );
  }

  Map<String, Object?> toMap() {
    return {
      const_api.id: id,
      const_api.firstName: firstName,
      const_api.lastName: lastName,
      const_api.middleName: middleName,
      const_api.avatar: avatar,
    };
  }
}
