import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../dev.dart' as dev;

part 'content.freezed.dart';

part 'content.g.dart';

@freezed
class Content with _$Content {
  const factory Content({
    required int id,
    required String text,
    required List<String> photos,
    required List<String> videos,
    required List<String> audios,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  // TODO: remove it
  static Content random() {
    final id = dev.randomInt(pow(10, 6).toInt());
    final text = dev.randomString(dev.randomInt(300) + 5000);
    final photos = List<String>.generate(
      dev.randomInt(10),
      (i) => dev.randomString(i, noSpace: true, useEn: true),
    );
    final videos = List<String>.generate(
      dev.randomInt(10),
      (i) => dev.randomString(i, noSpace: true, useEn: true),
    );
    final audios = List<String>.generate(
      dev.randomInt(10),
      (i) => dev.randomString(i, noSpace: true, useEn: true),
    );

    return Content(
      id: id,
      text: text,
      photos: photos,
      videos: videos,
      audios: audios,
    );
  }
}
