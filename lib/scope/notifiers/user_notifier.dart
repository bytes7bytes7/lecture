import 'package:rest_client/rest_client.dart';
import 'package:riverpod/riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  set user(User value) => state = value;
}
