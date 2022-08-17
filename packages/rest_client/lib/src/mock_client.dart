import 'package:common/common.dart';
import 'package:common/dev.dart' as dev;

import 'constants/api.dart' as const_api;
import 'models/error_details.dart';
import 'models/models.dart';
import 'rest_client.dart';

const _dur = Duration(seconds: 2);
const _tokenLen = 32;

class MockClient implements RestClient {
  @override
  Future<RegisterResp> register({
    required String login,
    required String password,
  }) async {
    return Future.delayed(
      _dur,
      () {
        switch (dev.randomInt(4)) {
          case 0:
            return RegisterResp(
              login: login,
              firstName: dev.randomString(
                dev.randomInt(10),
                noSpace: true,
              ),
              lastName: dev.randomString(
                dev.randomInt(10),
                noSpace: true,
              ),
              middleName: dev.randomBool()
                  ? dev.randomString(
                      dev.randomInt(10),
                      noSpace: true,
                    )
                  : null,
            );
          case 1:
            return RegisterResp(
              error: RespError(
                statusCode: 400,
                message: 'Bad request syntax or unsupported method',
                details: ErrorDetails(
                  login: [
                    const_api.Details.notValidLogin,
                  ],
                ),
              ),
            );
          case 2:
            return RegisterResp(
              error: RespError(
                statusCode: 400,
                message: 'Bad request syntax or unsupported method',
                details: ErrorDetails(
                  login: [
                    const_api.Details.loginAlreadyInUse,
                  ],
                ),
              ),
            );
          default:
            throw Exception('Mock exception');
        }
      },
    );
  }

  @override
  Future<VerifyCodeResp> verifyCode(String code) async {
    return Future.delayed(
      _dur,
      () {
        switch (dev.randomInt(2)) {
          case 0:
            return VerifyCodeResp(
              verified: dev.randomBool(),
            );
          default:
            throw Exception('Mock exception');
        }
      },
    );
  }

  @override
  Future<SetPersonalInfoResp> setPersonalInfo({
    required String firstName,
    required String lastName,
    required String? middleName,
  }) async {
    return Future.delayed(
      _dur,
      () {
        switch (dev.randomInt(2)) {
          case 0:
            return SetPersonalInfoResp(
              firstName: firstName,
              lastName: lastName,
              middleName: middleName,
            );
          default:
            throw Exception('Mock exception');
        }
      },
    );
  }

  @override
  Future<LogInResp> logIn({
    required String login,
    required String password,
  }) async {
    return Future.delayed(
      _dur,
      () {
        switch (dev.randomInt(3)) {
          case 0:
            return LogInResp(
              refresh: dev.randomString(
                _tokenLen,
                noSpace: true,
                useEn: true,
                useNum: true,
              ),
              access: dev.randomString(
                _tokenLen,
                noSpace: true,
                useEn: true,
                useNum: true,
              ),
            );
          case 1:
            return LogInResp(
              error: RespError(
                statusCode: 401,
                message: 'No permission -- see authorization schemes',
                details: ErrorDetails(
                  detail: const_api.Details.noAccount,
                ),
              ),
            );
          default:
            throw Exception('Mock exception');
        }
      },
    );
  }

  @override
  Future<RecoverResp> recover(String login) async {
    return Future.delayed(
      _dur,
      () {
        switch (dev.randomInt(2)) {
          case 0:
            return RecoverResp(
              sentEmail: dev.randomBool(),
            );
          default:
            throw Exception('Mock exception');
        }
      },
    );
  }

  @override
  Future<ChangePasswordResp> changePassword(String password) async {
    return Future.delayed(
      _dur,
      () {
        switch (dev.randomInt(2)) {
          case 0:
            return ChangePasswordResp(
              refresh: dev.randomString(
                _tokenLen,
                noSpace: true,
                useEn: true,
                useNum: true,
              ),
              access: dev.randomString(
                _tokenLen,
                noSpace: true,
                useEn: true,
                useNum: true,
              ),
            );
          default:
            throw Exception('Mock exception');
        }
      },
    );
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
  Future<VerifyTokenResp> verifyToken(String token) async {
    return Future.delayed(
      _dur,
      () {
        if (dev.randomBool()) {
          return VerifyTokenResp();
        } else {
          return VerifyTokenResp(
            error: RespError(
              statusCode: 401,
              message: 'No permission -- see authorization schemes',
              details: ErrorDetails(
                detail: 'Token is invalid or expired',
                code: 'token_not_valid',
              ),
            ),
          );
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
  Future<User> getMe() async {
    return Future.delayed(_dur, User.random);
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
