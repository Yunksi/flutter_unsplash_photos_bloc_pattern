import 'package:json_annotation/json_annotation.dart';

part 'profile_image.g.dart';

@JsonSerializable()
class ProfileImage {
  final Uri small;
  final Uri medium;
  final Uri large;

  ProfileImage(this.small, this.medium, this.large);

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);
}
