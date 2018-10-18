import 'dart:async';

import 'package:flutter_photo/api/api.dart';
import 'package:flutter_photo/json/photo.dart';
import 'package:rxdart/rxdart.dart';

class PhotoDetailBloc {
  final API api;

  PublishSubject<String> _photoId = PublishSubject<String>();
  final _streamController = BehaviorSubject<Photo>();

  Sink<String> get photoId => _photoId;
  Stream<Photo> get photo => _streamController.stream;

  PhotoDetailBloc(this.api) {
    _photoId.stream.listen((photoId) {
      print(photoId);
      api.getPhoto(photoId).then((photo) {
        _streamController.add(photo);
      });
    });
  }
}
