import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _item = [];

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

    notifyListeners();
  }
}
