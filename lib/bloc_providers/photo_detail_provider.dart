import 'package:flutter/material.dart';
import 'package:flutter_photo/api/api.dart';
import 'package:flutter_photo/bloc/photo_detail_bloc.dart';

class PhotoDetailProvider extends InheritedWidget {
  final PhotoDetailBloc photoDetailBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PhotoDetailBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(PhotoDetailProvider)
              as PhotoDetailProvider)
          .photoDetailBloc;

  PhotoDetailProvider({Key key, PhotoDetailBloc photoDetailBloc, Widget child})
      : this.photoDetailBloc = photoDetailBloc ?? PhotoDetailBloc(API()),
        super(child: child, key: key);
}
