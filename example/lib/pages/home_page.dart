import 'package:flutter/material.dart';
import '../fragments/map_fragment.dart';

class HomePage extends StatefulWidget {
  final String startPoint = '';
  final String startPointLat = '';
  final String startPointLng = '';
  final String endPoint = '';
  final String endPointLat = '';
  final String endPointLng = '';
  final String budget = '';
  final String numberOfGuests = '';
  final bool isChangeText = true;

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: MapFragment(
          widget.startPoint,
          widget.startPointLat,
          widget.startPointLng,
          widget.endPoint,
          widget.endPointLat,
          widget.endPointLng,
          widget.numberOfGuests,
          widget.budget,
          widget.isChangeText
      ),
    );
  }
}
