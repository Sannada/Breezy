import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'fragments/route_details.dart';
import 'fragments/map_fragment.dart';
import 'fragments/preferences.dart';
import 'fragments/travel_histrory_fragment.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        "/maps": (BuildContext context) => MapFragment(),
        "/preferences": (BuildContext context) => Preferences(),
        "/route_details": (BuildContext context) => RouteDetails(),
        "/travel_history": (BuildContext context) => TravelHistory(),
      },
      home: HomePage(),
    );
  }
}