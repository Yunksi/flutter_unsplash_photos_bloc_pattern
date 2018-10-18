import 'dart:async';
import 'dart:convert';

import 'package:flutter_photo/api-key.dart';
import 'package:flutter_photo/json/photo.dart';
import 'package:http/http.dart' as http;

class API {
  final http.Client _client = http.Client();

  Future<List<Photo>> getPhotos() async {
    const String _url =
        'https://api.unsplash.com/photos?page=1&per_page=30&client_id=$api_key';
    List<Photo> list = [];

    await _client
        .get(Uri.parse(_url), headers: {'Accept-Version': 'v1'})
        .then((res) => res.body)
        .then(json.decode)
        .then((photos) =>
            photos.forEach((photo) => list.add(Photo.fromJson(photo))));

    return list;
  }

  Future<List<Photo>> searchPhotos(String query) async {
    const String _url =
        'https://api.unsplash.com/search/photos?page=1&per_page=30&query={1}&client_id=$api_key';
    List<Photo> list = [];

    await _client
        .get(Uri.parse(_url.replaceFirst('{1}', query)),
            headers: {'Accept-Version': 'v1'})
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json['results'])
        .then((photos) =>
            photos.forEach((photo) => list.add(Photo.fromJson(photo))));

    return list;
  }

  Future<Photo> getPhoto(String photoId) async {
    const String _url =
        'https://api.unsplash.com/photos/{1}/info?client_id=$api_key';

    Photo photo;

    await _client
        .get(Uri.parse(_url.replaceFirst('{1}', photoId)),
            headers: {'Accept-Version': 'v1'})
        .then((res) => res.body)
        .then(json.decode)
        .then((value) => photo = Photo.fromJson(value));

    return photo;
  }
}
