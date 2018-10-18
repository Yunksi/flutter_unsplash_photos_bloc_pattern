import 'package:json_annotation/json_annotation.dart';

part 'photo_location.g.dart';

@JsonSerializable()
class Location extends Object {
  final String title;
  final String name;
  final String city;
  final String country;
  final Position position;

  Location(this.title, this.name, this.city, this.country, this.position);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@JsonSerializable()
class Position extends Object {
  final double latitude;
  final double longitude;

  Position(this.latitude, this.longitude);

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}
