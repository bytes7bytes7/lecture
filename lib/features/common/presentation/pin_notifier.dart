import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app.dart' as const_app;

class PinNotifier extends StateNotifier<String> {
  PinNotifier() : super('');

  set newState(String newValue) => state = newValue;

  bool get isValid {
    return state.length == const_app.pinLen && int.tryParse(state) != null;
  }
}
