import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_quotes_quill/all.dart';
import 'package:rest_client/rest_client.dart';

import '../../scope/app_scope.dart';
import '../interface/user_repo.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl(this._ref);

  final ProviderRef _ref;

  RestClient get _restClient => _ref.read(AppScope.get().restClient);

  SpreadQuillManager get _quillManager =>
      _ref.read(AppScope.get().loggerManager);

  @override
  Future<void> signUp(String login, String password) async {
    try {
      final token = await _restClient.signUp(login, password);
      _quillManager.log('get token: $token');
      _ref.read(AppScope.get().user.notifier).refreshToken(token);
      // TODO: maybe add getUserInfo here
    } catch (e) {
      _quillManager.error('signUp error: $e');
    }
  }

  @override
  Future<void> refreshToken() async {
    final token = _ref.read(AppScope.get().user).token;
    if (token != null) {
      final newToken = _restClient.refreshToken(token);
      _ref.read(AppScope.get().loggerManager).log('refreshed token: $newToken');
      return;
    }

    _ref.read(AppScope.get().loggerManager).log('token is null');
    throw Exception('Token is null');
  }

  @override
  Future<void> deleteUser() async {
    _ref.read(AppScope.get().loggerManager).log('delete user');
    return _restClient.deleteUser();
  }

  @override
  Future<void> changeUserInfo() async {
    final user = _ref.read(AppScope.get().user);
    _ref
        .read(AppScope.get().loggerManager)
        .log('separate user from sensitive information');
    return _restClient.changeUserInfo(user.toJson());
  }

  @override
  Future<User> getUserInfo(int id) async {
    return _restClient.getUser(id);
  }
}
