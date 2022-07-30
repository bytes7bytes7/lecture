import 'constants/api.dart' as const_api;
import 'dev.dart' as dev;
import 'models/models.dart';
import 'rest_client.dart';

const _dur = Duration(seconds: 2);
const _tokenLen = 32;

class MockClient implements RestClient {
  @override
  Future<Map<String, String>> signUp(String login, String password) async {
    return Future.delayed(
      _dur,
      () {
        switch (dev.randomInt(3)) {
          case 0:
            return {
              const_api.login: login,
              const_api.password: password,
            };
          case 1:
            return {
              const_api.error: 'The phone number entered is not valid.',
            };
          default:
            return {
              const_api.error: 'user with this phone already exists.',
            };
        }
      },
    );
  }

  @override
  Future<bool> confirmCode(String code) async {
    return Future.delayed(
      _dur,
      dev.randomBool,
    );
  }

  @override
  Future<void> setPersonalInfo(User user) async {
    return Future.delayed(_dur);
  }

  @override
  Future<String> signIn(String login, String password) async {
    return Future.delayed(
      _dur,
      () => dev.randomBool()
          ? dev.randomString(
              _tokenLen,
              noSpace: true,
              useEn: true,
              useNum: true,
            )
          : '',
    );
  }

  @override
  Future<void> recoverPasswd(String login) async {
    return Future.delayed(_dur);
  }

  @override
  Future<void> setNewPasswd(String password) async {
    return Future.delayed(_dur);
  }

  @override
  Future<void> logOut() async {
    return Future.delayed(_dur);
  }

  @override
  Future<int> addLecture(Lecture lecture) async {
    return Future.delayed(_dur, () => dev.randomInt(1000));
  }

  @override
  Future<void> deleteLecture(int id) async {
    return Future.delayed(_dur);
  }

  @override
  Future<List<Lecture>> getLectures(
    int? id,
    Map<String, dynamic> filter,
  ) async {
    return Future.delayed(
      _dur,
      () => List.generate(dev.randomInt(15), (index) => Lecture.random()),
    );
  }

  @override
  Future<Content?> getContent(int id) async {
    return Future.delayed(_dur, Content.random);
  }

  @override
  Future<List<int>> getPhoto(int id) async {
    return Future.delayed(
      _dur,
      () => dev.randomList<int>(dev.randomInt(10000)),
    );
  }

  @override
  Future<List<int>> getVideo(int id) => getPhoto(id);

  @override
  Future<List<int>> getAudio(int id) => getPhoto(id);

  @override
  Future<void> addBookmark(int id) async {
    return Future.delayed(_dur);
  }

  @override
  Future<void> deleteBookmark(int id) async {
    return Future.delayed(_dur);
  }

  @override
  Future<List<Lecture>> getUserLectures(int id) async {
    return Future.delayed(
      _dur,
      () => List.generate(dev.randomInt(20), (index) => Lecture.random()),
    );
  }

  @override
  Future<Map<String, String>> getToken(String login, String password) async {
    return Future.delayed(
      _dur,
      () {
        if (dev.randomBool()) {
          return <String, String>{
            const_api.token: dev.randomString(
              _tokenLen,
              noSpace: true,
              useEn: true,
              useNum: true,
            ),
          };
        } else {
          return {
            const_api.detail:
                'No active account found with the given credentials',
          };
        }
      },
    );
  }

  @override
  Future<String> refreshToken(String token) async {
    return Future.delayed(
      _dur,
      () => dev.randomString(
        _tokenLen,
        noSpace: true,
        useEn: true,
        useNum: true,
      ),
    );
  }

  @override
  Future<void> deleteUser() async {
    return Future.delayed(_dur);
  }

  @override
  Future<void> changeUserInfo(Map<String, dynamic> params) async {
    return Future.delayed(_dur);
  }

  @override
  Future<User> getUser(int id) async {
    return Future.delayed(_dur, User.random);
  }

  @override
  Future<List<String>> findInstitution(String query) async {
    return Future.delayed(
      _dur,
      () => List.generate(
        dev.randomInt(30),
        (index) => dev.randomString(dev.randomInt(30) + 10),
      ),
    );
  }

  @override
  Future<List<String>> findSubject(String query) async {
    return Future.delayed(
      _dur,
      () => List.generate(
        dev.randomInt(30),
        (index) => dev.randomString(dev.randomInt(10) + 10),
      ),
    );
  }

  @override
  Future<List<User>> findAuthor(String query) async {
    return Future.delayed(
      _dur,
      () => List.generate(
        dev.randomInt(30),
        (index) => User.random(),
      ),
    );
  }
}
