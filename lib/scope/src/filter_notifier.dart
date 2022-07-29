import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/filter_config.dart';

class FilterNotifier extends StateNotifier<FilterConfig> {
  FilterNotifier(super.state) : _oldState = state.copyWith();

  FilterConfig _oldState;

  set institution(String value) {
    state = state.copyWith(institution: value);
  }

  set subject(String value) {
    state = state.copyWith(subject: value);
  }

  set lecturer(String value) {
    state = state.copyWith(lecturer: value);
  }

  set author(String value) {
    state = state.copyWith(author: value);
  }

  set beginDate(String value) {
    state = state.copyWith(beginDate: value);
  }

  set endDate(String value) {
    state = state.copyWith(endDate: value);
  }

  bool get isFilterEmpty {
    return state.institution.isEmpty &&
        state.subject.isEmpty &&
        state.lecturer.isEmpty &&
        state.author.isEmpty &&
        state.beginDate.isEmpty &&
        state.endDate.isEmpty;
  }

  bool get hasStateChanged {
    return state.institution != _oldState.institution ||
        state.subject != _oldState.subject ||
        state.lecturer != _oldState.lecturer ||
        state.author != _oldState.author ||
        state.beginDate != _oldState.beginDate ||
        state.endDate != _oldState.endDate;
  }

  void dropFilter() {
    state = FilterConfig.empty;
  }

  void updateFilter() {
    // to update state
    state = state.copyWith();
    _oldState = state.copyWith();
  }
}
