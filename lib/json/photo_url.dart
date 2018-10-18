import 'package:json_annotation/json_annotation.dart';

part 'photo_url.g.dart';

@JsonSerializable()
class PhotoUrl extends Object {
  final Uri raw;
  final Uri full;
  final Uri regular;
  final Uri small;
  final Uri thumb;

  PhotoUrl(this.raw, this.full, this.regular, this.small, this.thumb);

  factory PhotoUrl.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlFromJson(json);
}
