// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoUrl _$PhotoUrlFromJson(Map<String, dynamic> json) {
  return PhotoUrl(
      json['raw'] == null ? null : Uri.parse(json['raw'] as String),
      json['full'] == null ? null : Uri.parse(json['full'] as String),
      json['regular'] == null ? null : Uri.parse(json['regular'] as String),
      json['small'] == null ? null : Uri.parse(json['small'] as String),
      json['thumb'] == null ? null : Uri.parse(json['thumb'] as String));
}

Map<String, dynamic> _$PhotoUrlToJson(PhotoUrl instance) => <String, dynamic>{
      'raw': instance.raw?.toString(),
      'full': instance.full?.toString(),
      'regular': instance.regular?.toString(),
      'small': instance.small?.toString(),
      'thumb': instance.thumb?.toString()
    };
