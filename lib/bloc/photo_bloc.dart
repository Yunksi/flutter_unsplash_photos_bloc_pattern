import 'dart:async';

import 'package:flutter_photo/api/api.dart';
import 'package:flutter_photo/json/photo.dart';
import 'package:rxdart/rxdart.dart';

class PhotoBloc {
  final API api;
  int page = 1;

  Stream<List<Photo>> _photos = Stream.empty();
  Stream<bool> _isSearching = Stream.empty();

  PublishSubject<String> _query = PublishSubject<String>();
  PublishSubject<bool> _search = PublishSubject<bool>();
  final _streamController = BehaviorSubject<List<Photo>>();

  Stream<List<Photo>> get photos => _streamController.stream;
  Stream<bool> get search => _isSearching;
  Sink<String> get query => _query;
  Sink<bool> get isSearching => _search;

  PhotoBloc(this.api) {
    api.getPhotos().then((photos) {
      _streamController.add(photos);
    });

    _query.stream.debounce(Duration(milliseconds: 500)).listen((query) {
      if (query != "")
        api.searchPhotos(query).then((searchedPhotos) {
          _streamController.add(searchedPhotos);
        });
      else
        api.getPhotos().then((photos) {
          _streamController.add(photos);
        });
    });

    _isSearching = _search.map((foo) => !foo);
  }

  void dispose() {
    _streamController.close();
    _search.close();
    _query.close();
  }
}
