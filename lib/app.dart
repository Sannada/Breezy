import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'fragments/route_details.dart';
import 'fragments/map_fragment.dart';
import 'fragments/preferences.dart';
import 'fragments/db_fragment.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        "/maps": (BuildContext context) => MapFragment(),
        "/preferences": (BuildContext context) => Preferences(),
        "/route_details": (BuildContext context) => RouteDetails(),
        "/travel_history": (BuildContext context) => DBFragment(),
      },
      home: HomePage(),
    );
  }
}