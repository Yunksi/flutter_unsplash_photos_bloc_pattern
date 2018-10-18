// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
      json['id'] as String,
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      json['width'] as int,
      json['height'] as int,
      json['urls'] == null
          ? null
          : PhotoUrl.fromJson(json['urls'] as Map<String, dynamic>),
      json['links'] == null
          ? null
          : PhotoLink.fromJson(json['links'] as Map<String, dynamic>),
      json['likes'] as int,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      json['exif'] == null
          ? null
          : Exif.fromJson(json['exif'] as Map<String, dynamic>),
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      json['views'] as int,
      json['downloads'] as int,
      json['description'] as String,
      (json['categories'] as List)?.map((e) => e as String)?.toList(),
      (json['tags'] as List)
          ?.map(
              (e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.photoId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'width': instance.width,
      'height': instance.height,
      'urls': instance.urls,
      'links': instance.links,
      'likes': instance.likes,
      'user': instance.user,
      'exif': instance.exif,
      'location': instance.location,
      'views': instance.views,
      'downloads': instance.downloads,
      'description': instance.description,
      'categories': instance.categories,
      'tags': instance.tags
    };
