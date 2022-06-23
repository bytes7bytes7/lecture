import 'package:quick_quotes_quill/quick_quotes_quill.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';
import 'package:rest_client/rest_client.dart';
import 'package:riverpod/riverpod.dart';

import '../models/filter_config.dart';
import '../repositories/impl/filter_repo_impl.dart';
import '../repositories/impl/lecture_repo_impl.dart';
import '../repositories/impl/storage_repo_impl.dart';
import '../repositories/interface/filter_repo.dart';
import '../repositories/interface/lecture_repo.dart';
import '../repositories/interface/storage_repo.dart';
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

  final lectureRepo = Provider<LectureRepo>((ref) => LectureRepoImpl());

  final filterRepo = Provider<FilterRepo>((ref) => FilterRepoImpl());

  final storageRepo = Provider<StorageRepo>((ref) => StorageRepoImpl());
}
