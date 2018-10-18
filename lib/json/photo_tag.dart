import 'package:json_annotation/json_annotation.dart';

part 'photo_tag.g.dart';

@JsonSerializable()
class Tag extends Object {
  final String title;

  Tag(this.title);

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
