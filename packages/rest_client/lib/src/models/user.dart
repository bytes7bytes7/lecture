import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/api.dart' as const_api;
import '../dev.dart' as dev;
import '../extensions/iterable_ext.dart';

part 'user.freezed.dart';

part 'user.g.dart';

const notAuthorizedUser = User(
  id: 0,
  firstName: '',
  lastName: '',
  email: '',
);

extension UserExt on User {
  String get beautifulID =>
      'id${id.toString().padLeft(const_api.idLength, '0')}';

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

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String firstName,
    required String lastName,
    required String? email,
    String? middleName,
    String? token,
    String? avatar,
    List<int>? bookmarks,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // TODO: remove it
  static User random() {
    final id = dev.randomInt(1000);
    final firstName = dev.randomString(dev.randomInt(5) + 7, noSpace: true);
    final lastName = dev.randomString(dev.randomInt(5) + 7, noSpace: true);
    final middleName = dev.randomInt(2) == 1
        ? dev.randomString(dev.randomInt(5) + 7, noSpace: true)
        : null;
    final email = '${dev.randomString(
      dev.randomInt(5) + 7,
      noSpace: true,
      useEn: true,
    )}@mail.ru';
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
