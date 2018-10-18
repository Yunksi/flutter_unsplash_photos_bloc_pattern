import 'package:json_annotation/json_annotation.dart';

part 'photo_link.g.dart';

@JsonSerializable()
class PhotoLink extends Object {
  final Uri self;
  final Uri html;
  final Uri download;
  @JsonKey(name: 'download_location')
  final Uri downloadLocation;

  PhotoLink(this.self, this.html, this.download, this.downloadLocation);

  factory PhotoLink.fromJson(Map<String, dynamic> json) =>
      _$PhotoLinkFromJson(json);
}
