import 'package:flutter/material.dart';
import 'package:flutter_photo/json/photo.dart';
import 'package:flutter_photo/pages/profile_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageBottomInfo extends StatelessWidget {
  const ImageBottomInfo({
    Key key,
    @required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              user: photo.user,
                            )));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  photo.user.profileImages.medium.toString()))),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          photo.user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                          '@' + photo.user.username,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: RaisedButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.teal,
              child: Text(
                'FOLLOW',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
              ),
              onPressed: () {},
            ),
          )
          // Row(
          //   children: <Widget>[
          //     Text(photo.likes.toString()),
          //     Padding(
          //       padding: EdgeInsets.only(left: 4.0, right: 2.0),
          //       child: Icon(
          //         FontAwesomeIcons.heart,
          //         color: Colors.redAccent,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
