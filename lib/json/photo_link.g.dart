// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoLink _$PhotoLinkFromJson(Map<String, dynamic> json) {
  return PhotoLink(
      json['self'] == null ? null : Uri.parse(json['self'] as String),
      json['html'] == null ? null : Uri.parse(json['html'] as String),
      json['download'] == null ? null : Uri.parse(json['download'] as String),
      json['download_location'] == null
          ? null
          : Uri.parse(json['download_location'] as String));
}

Map<String, dynamic> _$PhotoLinkToJson(PhotoLink instance) => <String, dynamic>{
      'self': instance.self?.toString(),
      'html': instance.html?.toString(),
      'download': instance.download?.toString(),
      'download_location': instance.downloadLocation?.toString()
    };
