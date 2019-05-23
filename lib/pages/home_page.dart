import 'package:breezy/screens/new_drawer.dart';
import 'package:flutter/material.dart';
import '../fragments/map_fragment.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: MapFragment(),
    );
  }
}
