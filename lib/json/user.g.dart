// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'] as String,
      json['username'] as String,
      json['name'] as String,
      json['total_likes'] as int,
      json['total_photos'] as int,
      json['total_collections'] as int,
      json['first_name'] as String,
      json['last_name'] as String,
      json['twitter_username'] as String,
      json['portfolio_url'] == null
          ? null
          : Uri.parse(json['portfolio_url'] as String),
      json['bio'] as String,
      json['location'] as String,
      json['links'] == null
          ? null
          : UserLink.fromJson(json['links'] as Map<String, dynamic>),
      json['profile_image'] == null
          ? null
          : ProfileImage.fromJson(
              json['profile_image'] as Map<String, dynamic>),
      json['instagram_username'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.userId,
      'username': instance.username,
      'name': instance.name,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'twitter_username': instance.twitterUsername,
      'portfolio_url': instance.portfolioUrl?.toString(),
      'bio': instance.bio,
      'location': instance.location,
      'links': instance.links,
      'profile_image': instance.profileImages,
      'instagram_username': instance.instagramUsername,
      'total_likes': instance.totalLikes,
      'total_photos': instance.totalPhotos,
      'total_collections': instance.totalCollections
    };
