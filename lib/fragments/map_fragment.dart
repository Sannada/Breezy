import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

const  kGoogleApiKey = "AIzaSyC9g_39KNI0QDKC1SW50Pz6Oz0YbHRBY8o";

class MapFragment extends StatefulWidget {
  @override
  _MapFragmentState createState() {
    return _MapFragmentState();
  }
}

class _MapFragmentState extends State<MapFragment> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(49.8450449, 24.0361399);
  Set<Marker> markers = Set();
  MapType _currentMapType = MapType.normal;
  LatLng centerPosition;


  void _onCameraMove(CameraPosition position) {
    centerPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {

    Future<Prediction> p = PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        mode: Mode.overlay, // Mode.fullscreen
        language: "en",
        components: [new Component(Component.country, "en")]);

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Google Maps"),
        ),
        body: Stack(children: <Widget>[
          GoogleMap(
            mapType: _currentMapType,
            myLocationEnabled: true,
            markers: markers,
            onCameraMove: _onCameraMove,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),


        ]),

    );
  }
}

