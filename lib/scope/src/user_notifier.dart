import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/rest_client.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  set newState(User newUser) => state = newUser;
}
