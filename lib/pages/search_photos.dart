import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_photo/bloc_providers/photo_detail_provider.dart';
import 'package:flutter_photo/bloc_providers/photo_provider.dart';
import 'package:flutter_photo/json/photo.dart';
import 'package:flutter_photo/pages/photo_detail_page.dart';
import 'package:flutter_photo/pages/profile_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter_photo/api-key.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPhotos extends StatefulWidget {
  @override
  SearchPhotosState createState() {
    return new SearchPhotosState();
  }
}

class SearchPhotosState extends State<SearchPhotos>
    with TickerProviderStateMixin {
  bool isSearching = false;
  bool isLoadingMore = false;
  int currentPageNumber = 1;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photoBloc = PhotoProvider.of(context);
    final photoDetailBloc = PhotoDetailProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.3,
        centerTitle: true,
        title: StreamBuilder(
          stream: photoBloc.search,
          initialData: false,
          builder: (context, snapshot) {
            isSearching = snapshot.data;
            if (snapshot.data == true) {
              return TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  onChanged: photoBloc.query.add,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white)));
            } else
              return Text(
                'FlutterPhotos',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              photoBloc.isSearching.add(isSearching);
            },
            icon: Icon(
              Icons.search,
              size: 20.0,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.teal,
              labelColor: Colors.grey[600],
              unselectedLabelColor: Colors.grey[350],
              tabs: [
                Tab(
                  text: 'Editorial',
                ),
                Tab(text: 'Trending'),
                Tab(text: 'Following')
              ]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(
                  child: StreamBuilder(
                    stream: photoBloc.photos,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<Photo> photos = snapshot.data;
                      return StaggeredGridView.countBuilder(
                        padding: EdgeInsets.all(4.0),
                        crossAxisCount: 4,
                        //controller: _scrollController,
                        itemCount: photos.length,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          String imgPath = photos[index].urls.thumb.toString();
                          return Material(
                            elevation: 8.0,
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(8.0)),
                            child: new InkWell(
                              onTap: () {
                                photoDetailBloc.photoId
                                    .add(photos[index].photoId);
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new PhotoDetailPage()));
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (context) => new ProfilePage(
                                //             user: snapshot.data[index].user)));
                              },
                              child: new Hero(
                                tag: imgPath,
                                child: new FadeInImage(
                                  image: new NetworkImage(imgPath),
                                  fit: BoxFit.cover,
                                  placeholder:
                                      new AssetImage("assets/wallfy.png"),
                                ),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (i) => new StaggeredTile.fit(2),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      );
                      // return PhotoCard(
                      //   photos: snapshot.data,
                      //   pageNumber: currentPageNumber,
                      // );
                    },
                  ),
                ),
                Center(child: Text('Coming soon!')),
                Center(child: Text('Coming soon!'))
              ],
            ),
          )
        ],
      ),

      // ],
    );
  }
}

class PhotoCard extends StatefulWidget {
  final List<Photo> photos;
  final int pageNumber;

  PhotoCard({Key key, this.photos, this.pageNumber}) : super(key: key);

  PhotoCardState createState() => PhotoCardState();
}

class PhotoCardState extends State<PhotoCard> {
  List<Photo> photos;
  int pageNumber;
  ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;

  @override
  void initState() {
    photos = widget.photos;
    pageNumber = widget.pageNumber;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<Photo>> _loadPhotos(int pageNumber) async {
    final response = await http.get(
        'https://api.unsplash.com/photos?page=$pageNumber&client_id=$api_key',
        headers: {'Accept-Version': 'v1'});

    var photos = json
        .decode(response.body)
        .map((photo) => Photo.fromJson(photo))
        .toList()
        .cast<Photo>();

    return photos;
  }

  bool _onNotification(Notification notification) {
    if (notification is ScrollNotification) {
      if (_scrollController.position.maxScrollExtent >
              _scrollController.offset &&
          _scrollController.position.maxScrollExtent -
                  _scrollController.offset <=
              100) {
        if (!isLoadingMore) {
          isLoadingMore = true;
          pageNumber += 1;
          _loadPhotos(pageNumber).then((newPhotos) {
            isLoadingMore = false;
            setState(() {
              photos.addAll(newPhotos);
            });
          });
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _onNotification,
      child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(4.0),
        crossAxisCount: 4,
        controller: _scrollController,
        itemCount: photos.length,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          String imgPath = photos[index].urls.small.toString();
          return Material(
            elevation: 8.0,
            borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
            child: new InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            new ProfilePage(user: photos[index].user)));
              },
              child: new Hero(
                tag: imgPath,
                child: new FadeInImage(
                  image: new NetworkImage(imgPath),
                  fit: BoxFit.cover,
                  placeholder: new AssetImage("assets/wallfy.png"),
                ),
              ),
            ),
          );
          // return ImageCard(photo: photos[index]);
        },
        staggeredTileBuilder: (i) => new StaggeredTile.fit(2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
