import 'package:common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  set newState(User newUser) => state = newUser;
}
