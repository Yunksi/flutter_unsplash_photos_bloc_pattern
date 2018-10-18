// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLink _$UserLinkFromJson(Map<String, dynamic> json) {
  return UserLink(
      json['self'] == null ? null : Uri.parse(json['self'] as String),
      json['html'] == null ? null : Uri.parse(json['html'] as String),
      json['photos'] == null ? null : Uri.parse(json['photos'] as String),
      json['likes'] == null ? null : Uri.parse(json['likes'] as String),
      json['portfolio'] == null ? null : Uri.parse(json['portfolio'] as String),
      json['following'] == null ? null : Uri.parse(json['following'] as String),
      json['followers'] == null
          ? null
          : Uri.parse(json['followers'] as String));
}

Map<String, dynamic> _$UserLinkToJson(UserLink instance) => <String, dynamic>{
      'self': instance.self?.toString(),
      'html': instance.html?.toString(),
      'photos': instance.photos?.toString(),
      'likes': instance.likes?.toString(),
      'portfolio': instance.portfolio?.toString(),
      'following': instance.following?.toString(),
      'followers': instance.followers?.toString()
    };
