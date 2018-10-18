// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
      json['title'] as String,
      json['name'] as String,
      json['city'] as String,
      json['country'] as String,
      json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'title': instance.title,
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'position': instance.position
    };

Position _$PositionFromJson(Map<String, dynamic> json) {
  return Position((json['latitude'] as num)?.toDouble(),
      (json['longitude'] as num)?.toDouble());
}

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude
    };
