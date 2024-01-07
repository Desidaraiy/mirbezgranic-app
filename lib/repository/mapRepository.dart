import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mirbezgranic/models/place_point.dart';

class MapRepository {
  static Future<List<PlacePoint>> getMapPoints() async {
    List<PlacePoint> mapPoints = [];
    String jsonString = await rootBundle.loadString('assets/json/places.json');
    List<dynamic> jsonList = json.decode(jsonString)['places'];
    for (var json in jsonList) {
      PlacePoint mapPoint = PlacePoint.fromJSON(json);
      mapPoints.add(mapPoint);
    }
    return mapPoints;
  }
}
