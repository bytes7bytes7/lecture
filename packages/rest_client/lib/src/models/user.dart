import 'package:json_annotation/json_annotation.dart';

import '../constants/api.dart' as const_api;
import '../dev.dart' as dev;
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
  final String? email;
  final String? middleName;
  final String? token;
  final String? avatar;
  final List<int>? bookmarks;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String get beautifulID =>
      'id${id.toString().padLeft(const_api.idLength, '0')}';

  // TODO: remove it
  static User random() {
    final id = dev.randomInt(1000);
    final firstName = dev.randomString(dev.randomInt(5) + 7, noSpace: true);
    final lastName = dev.randomString(dev.randomInt(5) + 7, noSpace: true);
    final middleName = dev.randomInt(2) == 1
        ? dev.randomString(dev.randomInt(5) + 7, noSpace: true)
        : null;
    final email =
        '${dev.randomString(dev.randomInt(5) + 7, noSpace: true)}@mail.ru';
    final token = dev.randomString(
      64,
      noSpace: true,
      useEn: true,
      useNum: true,
    );
    final avatar = dev.randomInt(2) == 1
        ? 'https://i.pinimg.com/564x/29/cf/ef/29cfef455b564112ab62371318593017.jpg'
        : null;

    final bookmarks = dev.randomInt(2) == 1
        ? List.generate(dev.randomInt(10), (index) => dev.randomInt(1000))
        : null;

    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      middleName: middleName,
      token: token,
      avatar: avatar,
      bookmarks: bookmarks,
    );
  }
}

class NotAuthorizedUser extends User {
  const NotAuthorizedUser()
      : super(
          id: -1,
          firstName: '',
          lastName: '',
          email: '',
        );
}
