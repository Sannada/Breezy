import 'package:flutter/material.dart';
import 'package:location_example/StartScrean/intro_screen.dart';
import 'package:location_example/StartScrean/splash_screen.dart';

import 'app.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => MyApp(),
  "/intro": (BuildContext context) => IntroScreen(),
};

void main() => runApp(new MaterialApp(
    theme:
    ThemeData(primaryColor: Colors.white, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));