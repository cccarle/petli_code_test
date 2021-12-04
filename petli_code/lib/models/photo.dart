import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:petli_code/consts/constants.dart';
import 'package:petli_code/services/shared_prefs.dart';

class Photo extends ChangeNotifier {
  final int albumId, id;

  final String title, url, thumbnailUrl;

  ValueNotifier<bool> isLiked = ValueNotifier<bool>(false);

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    required this.isLiked,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
      isLiked: getIsLiked(json['id']),
    );
  }

  static getIsLiked(int id) {
    if (Constants.likedPhotos.contains(id)) return ValueNotifier<bool>(true);

    return ValueNotifier<bool>(false);
  }

  toggelLike() async {
    isLiked.value = !isLiked.value;

    storeValueToSharedPrefs();

    notifyListeners();
  }

  storeValueToSharedPrefs() async {
    if (isLiked.value) Constants.likedPhotos.add(id);

    if (!isLiked.value) Constants.likedPhotos.remove(id);

    await SharedPrefs().setStringValue(
      SharedPrefs.CACHED_LIKE_IDS,
      json.encode(Constants.likedPhotos),
    );
  }
}
