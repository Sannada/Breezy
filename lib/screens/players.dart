import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Players {
  String keyword;
  int id;
  String autocompleteterm;
  String country;
  double lat;
  double lng;

  Players(
      {this.keyword,
      this.id,
      this.autocompleteterm,
      this.country,
      this.lat,
      this.lng});

  factory Players.fromJson(Map<String, dynamic> parsedJson) {
    return Players(
      keyword: parsedJson['keyword'] as String,
      id: parsedJson['id'],
      autocompleteterm: parsedJson['autocompleteTerm'] as String,
      country: parsedJson['country'] as String,
      lat: parsedJson['lat'] as double,
      lng: parsedJson['lng'] as double
    );
  }
}

class PlayersViewModel {
  static List<Players> players;

  static Future loadPlayers() async {
    try {
      players = new List<Players>();
      String jsonString = await rootBundle.loadString('assets/players.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['players'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        players.add(new Players.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}
