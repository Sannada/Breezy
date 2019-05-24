import 'package:flutter/material.dart';
import 'package:location_example/StartScrean/intro_screen.dart';
import 'package:location_example/StartScrean/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  "/intro": (BuildContext context) => IntroScreen(),
};

void main() => runApp(new MaterialApp(
    theme: new ThemeData(
      primaryColor: Colors.white,
      primaryColorDark: Colors.black,
      accentColor: Colors.black,
    ),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));