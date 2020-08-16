import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _item = [];

  List<Place> get item => [..._item];

  int get itemsCount => _item.length;

  Place itemByIndex(int index) => _item[index];
}
