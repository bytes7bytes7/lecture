import 'package:quick_quotes_quill/quick_quotes_quill.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';
import 'package:rest_client/rest_client.dart';
import 'package:riverpod/riverpod.dart';

import '../models/models.dart';
import '../repositories/impl/impls.dart';
import '../repositories/interface/interfaces.dart';
import 'providers/providers.dart';

mixin AppProviders {
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
      Provider<QuillManagerBase>((ref) => SpreadQuillManager.inst);

  final restClient =
      Provider<RestClient>((ref) => ClientFactory().createMockClient());

  final lectureRepo = Provider<LectureRepo>((ref) => LectureRepoImpl());

  final filterRepo = Provider<FilterRepo>((ref) => FilterRepoImpl());

  final storageRepo = Provider<StorageRepo>((ref) => StorageRepoImpl());
}
