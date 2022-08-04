import 'package:json_annotation/json_annotation.dart';

import '../dev.dart' as dev;

part 'content.g.dart';

@JsonSerializable()
class Content {
  Content({
    required this.text,
    required this.photos,
    required this.videos,
    required this.audios,
  });

  final String text;
  final List<String> photos;
  final List<String> videos;
  final List<String> audios;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

  // TODO: remove it
  static Content random() {
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
      text: text,
      photos: photos,
      videos: videos,
      audios: audios,
    );
  }
}
