// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_exif.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exif _$ExifFromJson(Map<String, dynamic> json) {
  return Exif(
      json['make'] as String,
      json['model'] as String,
      json['exposure_time'] as String,
      json['aperture'] as String,
      json['focal_length'] as String,
      json['iso'] as int);
}

Map<String, dynamic> _$ExifToJson(Exif instance) => <String, dynamic>{
      'make': instance.make,
      'model': instance.model,
      'exposure_time': instance.exposureTime,
      'aperture': instance.aperture,
      'focal_length': instance.focalLength,
      'iso': instance.iso
    };
