import 'package:quick_quotes_quill/all.dart';
import 'package:rest_client/rest_client.dart';
import 'package:riverpod/riverpod.dart';

import '../models/models.dart';
import '../repositories/impl/impls.dart';
import '../repositories/interface/interfaces.dart';
import 'notifiers/notifiers.dart';

mixin AppProviders {
  final filter = StateNotifierProvider<FilterNotifier, FilterConfig>((ref) {
    return FilterNotifier(
      FilterConfig.empty,
    );
  });

  final filterRepo = Provider<FilterRepo>(FilterRepoImpl.new);

  late final isFilterUpdated = StateProvider<bool>((ref) {
    // TODO: think up something clever
    ref.watch(filter);
    return ref.read(filter.notifier).hasStateChanged;
  });

  final lectureRepo = Provider<LectureRepo>(LectureRepoImpl.new);

  final loggerManager =
      Provider<SpreadQuillManager>((ref) => throw UnimplementedError());

  final restClient =
      Provider<RestClient>((ref) => ClientFactory().createMockClient());

  final storageRepo = Provider<StorageRepo>(StorageRepoImpl.new);

  // TODO: do not forget ot override it after auth
  final user = StateNotifierProvider<UserNotifier, User>(
    (ref) => throw UnimplementedError(),
  );
}
