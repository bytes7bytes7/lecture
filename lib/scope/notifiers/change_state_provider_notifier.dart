import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeStateProviderNotifier extends StateNotifier<StateProvider<bool>> {
  ChangeStateProviderNotifier(super.state);

  set newState(StateProvider<bool> newState) {
    state = newState;
  }
}
