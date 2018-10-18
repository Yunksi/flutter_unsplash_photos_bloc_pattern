import 'package:json_annotation/json_annotation.dart';

part 'user_link.g.dart';

@JsonSerializable()
class UserLink extends Object {
  final Uri self;
  final Uri html;
  final Uri photos;
  final Uri likes;
  final Uri portfolio;
  final Uri following;
  final Uri followers;

  UserLink(this.self, this.html, this.photos, this.likes, this.portfolio,
      this.following, this.followers);

  factory UserLink.fromJson(Map<String, dynamic> json) =>
      _$UserLinkFromJson(json);
}
