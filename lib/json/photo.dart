import 'package:flutter_photo/json/photo_exif.dart';
import 'package:flutter_photo/json/photo_link.dart';
import 'package:flutter_photo/json/photo_location.dart';
import 'package:flutter_photo/json/photo_tag.dart';
import 'package:flutter_photo/json/photo_url.dart';
import 'package:flutter_photo/json/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo extends Object {
  @JsonKey(name: 'id')
  final String photoId;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  final int width;
  final int height;
  final PhotoUrl urls;
  final PhotoLink links;
  final int likes;
  final User user;
  final Exif exif;
  final Location location;
  final int views;
  final int downloads;
  final String description;
  final List<String> categories;
  final List<Tag> tags;

  Photo(
      this.photoId,
      this.createdAt,
      this.updatedAt,
      this.width,
      this.height,
      this.urls,
      this.links,
      this.likes,
      this.user,
      this.exif,
      this.location,
      this.views,
      this.downloads,
      this.description,
      this.categories,
      this.tags);

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
