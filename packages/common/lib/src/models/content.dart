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
    final text = r'[{"insert":"Flutter Quill"},{"attributes":{"header":1},"insert":"\n"},{"insert":{"video":"https://www.youtube.com/watch?v=V4hgdKhIqtc&list=PLbhaS_83B97s78HsDTtplRTEhcFsqSqIK&index=1"}},{"insert":"\nRich text editor for Flutter"},{"attributes":{"header":2},"insert":"\n"},{"insert":"Quill component for Flutter"},{"attributes":{"header":3},"insert":"\n"},{"insert":"This "},{"attributes":{"italic":true,"background":"transparent"},"insert":"library"},{"insert":" supports "},{"attributes":{"bold":true,"background":"#ebd6ff"},"insert":"mobile"},{"insert":" platform "},{"attributes":{"underline":true,"bold":true,"color":"#e60000"},"insert":"only"},{"attributes":{"color":"rgba(0, 0, 0, 0.847)"},"insert":" and "},{"attributes":{"strike":true,"color":"black"},"insert":"web"},{"insert":" is not supported."},{"insert": "\n"}]';
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
