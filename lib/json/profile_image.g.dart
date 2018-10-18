// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileImage _$ProfileImageFromJson(Map<String, dynamic> json) {
  return ProfileImage(
      json['small'] == null ? null : Uri.parse(json['small'] as String),
      json['medium'] == null ? null : Uri.parse(json['medium'] as String),
      json['large'] == null ? null : Uri.parse(json['large'] as String));
}

Map<String, dynamic> _$ProfileImageToJson(ProfileImage instance) =>
    <String, dynamic>{
      'small': instance.small?.toString(),
      'medium': instance.medium?.toString(),
      'large': instance.large?.toString()
    };
