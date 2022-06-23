import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_config.freezed.dart';

part 'filter_config.g.dart';

@freezed
class FilterConfig with _$FilterConfig {
  const factory FilterConfig({
    required String institution,
    required String subject,
    required String lecturer,
    required String author,
    required String beginDate,
    required String endDate,
  }) = _FilterConfig;

  static const empty = FilterConfig(
    institution: '',
    subject: '',
    lecturer: '',
    author: '',
    beginDate: '',
    endDate: '',
  );

  factory FilterConfig.fromJson(Map<String, dynamic> json) =>
      _$FilterConfigFromJson(json);
}
