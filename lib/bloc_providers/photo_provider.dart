import 'package:flutter/material.dart';
import 'package:flutter_photo/api/api.dart';
import 'package:flutter_photo/bloc/photo_bloc.dart';

class PhotoProvider extends InheritedWidget {
  final PhotoBloc photoBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PhotoBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(PhotoProvider) as PhotoProvider)
          .photoBloc;

  PhotoProvider({Key key, PhotoBloc photoBloc, Widget child})
      : this.photoBloc = photoBloc ?? PhotoBloc(API()),
        super(child: child, key: key);
}
