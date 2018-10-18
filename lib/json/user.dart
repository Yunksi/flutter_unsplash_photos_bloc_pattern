import 'package:flutter_photo/json/profile_image.dart';
import 'package:flutter_photo/json/user_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  final String userId;
  final String username;
  final String name;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'twitter_username')
  final String twitterUsername;
  @JsonKey(name: 'portfolio_url')
  final Uri portfolioUrl;
  final String bio;
  final String location;
  final UserLink links;
  @JsonKey(name: 'profile_image')
  final ProfileImage profileImages;
  @JsonKey(name: 'instagram_username')
  final String instagramUsername;
  @JsonKey(name: 'total_likes')
  final int totalLikes;
  @JsonKey(name: 'total_photos')
  final int totalPhotos;
  @JsonKey(name: 'total_collections')
  final int totalCollections;

  User(
      this.userId,
      this.username,
      this.name,
      this.totalLikes,
      this.totalPhotos,
      this.totalCollections,
      this.firstName,
      this.lastName,
      this.twitterUsername,
      this.portfolioUrl,
      this.bio,
      this.location,
      this.links,
      this.profileImages,
      this.instagramUsername);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
