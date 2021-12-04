import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:petli_code/consts/constants.dart';
import 'package:petli_code/models/photo.dart';
import 'package:petli_code/services/api.dart';
import 'package:petli_code/services/shared_prefs.dart';
import 'package:petli_code/widgets/list_item_card.dart';
import 'package:petli_code/widgets/on_error.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String error = '';

  bool hasLoadedData = false;

  late List<Photo> photoList;

  @override
  void initState() {
    getStoredLikes();
    fetchPhotos();

    super.initState();
  }

/* 
Fetch all stored photo IDs that has been liked.
Used in Photo-model to decided if a photo has been liked or not.

Preferable this is handled by backend.
 */

  getStoredLikes() async {
    dynamic cachedLikeIds =
        await SharedPrefs().getStringValue(SharedPrefs.CACHED_LIKE_IDS) ?? "[]";

    Constants.likedPhotos = json.decode(cachedLikeIds);
  }

  fetchPhotos() async {
    dynamic res = await Api().httpGet(Constants.photosUrl);

    if (res['succes']) {
      setState(() {
        photoList = res['body']
            .map<Photo>(
              (photo) => Photo.fromJson(photo),
            )
            .toList();

        hasLoadedData = true;
      });
    }

    if (!res['succes']) {
      setState(() {
        error = res['msg'];
        hasLoadedData = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: !hasLoadedData
              ? CircularProgressIndicator()
              : photoList.isNotEmpty && error.isEmpty
                  ? ListView.builder(
                      itemCount: photoList.length,
                      itemBuilder: (context, index) =>
                          ListItemCard(photoList[index]),
                    )
                  : OnError(
                      error,
                      callback: fetchPhotos,
                    ),
        ),
      ),
    );
  }
}
