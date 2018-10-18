import 'package:flutter/material.dart';
import 'package:flutter_photo/api/api.dart';
import 'package:flutter_photo/bloc/photo_bloc.dart';
import 'package:flutter_photo/bloc/photo_detail_bloc.dart';
import 'package:flutter_photo/bloc_providers/photo_detail_provider.dart';
import 'package:flutter_photo/bloc_providers/photo_provider.dart';
import 'package:flutter_photo/pages/search_photos.dart';

class PhotosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhotoProvider(
      photoBloc: PhotoBloc(API()),
      child: PhotoDetailProvider(
        photoDetailBloc: PhotoDetailBloc(API()),
        child: MaterialApp(
            theme: ThemeData(primaryColor: Colors.pink),
            title: 'Flutter Photos',
            debugShowCheckedModeBanner: false,
            home: SearchPhotos()),
      ),
    );
  }
}
