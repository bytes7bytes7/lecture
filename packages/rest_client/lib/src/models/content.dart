import 'package:json_annotation/json_annotation.dart';

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
}
