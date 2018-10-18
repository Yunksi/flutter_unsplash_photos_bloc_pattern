import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_photo/bloc_providers/photo_detail_provider.dart';
import 'package:flutter_photo/json/photo.dart';
import 'package:flutter_photo/widgets/image_bottom_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PhotoDetailPage extends StatefulWidget {
  PhotoDetailPageState createState() => PhotoDetailPageState();
}

class PhotoDetailPageState extends State<PhotoDetailPage> {
  static const platform = const MethodChannel('download_file_channel');

  downloadPhoto(String imageName, String imageUrl) async {
    try {
      final String result = await platform
          .invokeMethod('downloadFile', {'name': imageName, 'url': imageUrl});

      print(result);
    } on PlatformException catch (e) {
      print(e);
    }
    // Dio dio = Dio();

    // try {
    //   var dir = await getApplicationDocumentsDirectory();
    //   await dio.download(imageUrl, "${dir.path}/image.jpg",
    //       onProgress: (rec, total) {
    //     print("Rec: $rec, Total: $total");
    //     var progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
    //     print(progressString);
    //   });
    // } catch (e) {
    //   print(e);
    // }

    // print("Download completed");
  }

  @override
  Widget build(BuildContext context) {
    final photoDetailBloc = PhotoDetailProvider.of(context);
    return Scaffold(
        appBar: null,
        body: StreamBuilder(
          stream: photoDetailBloc.photo,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            Photo photo = snapshot.data;

            return ListView(
              children: <Widget>[
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeInImage.assetNetwork(
                        image: photo.urls.small.toString(),
                        placeholder: 'assets/wallfy.png',
                      ),
                      photo.description != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                photo.description != null
                                    ? photo.description
                                    : '',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'DancingScript'),
                              ),
                            )
                          : Container(),
                      photo.location != null
                          ? GestureDetector(
                              onTap: () {
                                print('View location');
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.mapMarkerAlt,
                                      color: Colors.grey,
                                      size: 16.0,
                                    ),
                                    Padding(
                                      child: Text(
                                        photo.location.name,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16.0),
                                      ),
                                      padding: EdgeInsets.only(left: 5.0),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Uploaded on ' +
                              DateFormat('dd MMMM yyyy')
                                  .format(photo.createdAt),
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                      ),
                      Padding(
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      ),
                      ImageBottomInfo(photo: photo),
                      Padding(
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      ),
                      Container(
                        height: 80.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: photo.tags.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black, width: 1.0),
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      photo.tags[index].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      ),
                      Container(
                          height: 80.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Likes',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    photo.likes.toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                width: 1.0,
                                color: Colors.grey.shade300,
                                margin: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Downloads',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w300)),
                                  Text(
                                    photo.downloads.toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                width: 1.0,
                                color: Colors.grey.shade300,
                                margin: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Views',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w300)),
                                  Text(
                                    photo.views.toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'like',
                              mini: true,
                              backgroundColor: Colors.white,
                              child: Icon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.teal,
                                size: 14.0,
                              ),
                              onPressed: () {},
                            ),
                            FloatingActionButton(
                              heroTag: 'share',
                              mini: true,
                              backgroundColor: Colors.white,
                              child: Icon(
                                FontAwesomeIcons.share,
                                color: Colors.grey,
                                size: 14.0,
                              ),
                              onPressed: () {},
                            ),
                            FloatingActionButton(
                                heroTag: 'download',
                                mini: true,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.download,
                                  color: Colors.grey,
                                  size: 14.0,
                                ),
                                onPressed: () {
                                  downloadPhoto(photo.photoId,
                                      photo.links.download.toString());
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
