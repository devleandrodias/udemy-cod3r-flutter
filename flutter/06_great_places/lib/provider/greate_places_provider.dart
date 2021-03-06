import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db_util.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _item = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');

    _item = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(item['image'])))
        .toList();

    notifyListeners();
  }

  List<Place> get item => [..._item];

  int get itemsCount => _item.length;

  Place itemByIndex(int index) => _item[index];

  void addPlaces(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );

    _item.add(newPlace);

    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });

    notifyListeners();
  }
}
