import 'package:flutter/material.dart';
import 'package:flutter_photo/json/photo.dart';
import 'package:flutter_photo/widgets/image_bottom_info.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key key,
    @required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[350]),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              child: Image.network(photo.urls.regular.toString())),
          new ImageBottomInfo(photo: photo)
        ],
      ),
    );
  }
}
