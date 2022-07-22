import 'package:quick_quotes_quill/all.dart';
import 'package:rest_client/rest_client.dart';
import 'package:riverpod/riverpod.dart';

import '../models/models.dart';
import '../repositories/impl/impls.dart';
import '../repositories/interface/interfaces.dart';
import 'providers/providers.dart';

mixin AppProviders {
  // TODO: do not forget ot override it after auth
  final account = Provider<User>((ref) => throw UnimplementedError());

  final filter = StateNotifierProvider<FilterNotifier, FilterConfig>((ref) {
    return FilterNotifier(
      FilterConfig.empty,
    );
  });

  late final isFilterUpdated = Provider<bool>((ref) {
    // TODO: think up something clever
    ref.watch(filter);
    return ref.read(filter.notifier).hasStateChanged;
  });

  final loggerManager =
      Provider<SpreadQuillManager>((ref) => throw UnimplementedError());

  final restClient =
      Provider<RestClient>((ref) => ClientFactory().createMockClient());

  final lectureRepo = Provider<LectureRepo>(LectureRepoImpl.new);

  final filterRepo = Provider<FilterRepo>(FilterRepoImpl.new);

  final storageRepo = Provider<StorageRepo>(StorageRepoImpl.new);
}
