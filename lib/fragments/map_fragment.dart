import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapFragment extends StatefulWidget {
  @override
  _MapFragmentState createState() {
    return _MapFragmentState();
  }
}

class _MapFragmentState extends State<MapFragment> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Google Maps"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        rotateGesturesEnabled: true,
        myLocationEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(49.8450449, 24.0361399),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
