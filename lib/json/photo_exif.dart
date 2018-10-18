import 'package:json_annotation/json_annotation.dart';

part 'photo_exif.g.dart';

@JsonSerializable()
class Exif extends Object {
  final String make;
  final String model;
  @JsonKey(name: "exposure_time")
  final String exposureTime;
  final String aperture;
  @JsonKey(name: "focal_length")
  final String focalLength;
  final int iso;

  Exif(this.make, this.model, this.exposureTime, this.aperture,
      this.focalLength, this.iso);

  factory Exif.fromJson(Map<String, dynamic> json) => _$ExifFromJson(json);
}
