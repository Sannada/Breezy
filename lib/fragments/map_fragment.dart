import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapFragment extends StatefulWidget {
  @override
  _MapFragmentState createState() {
    return _MapFragmentState();
  }
}

class _MapFragmentState extends State<MapFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(49.85, 24.03), minZoom: 5.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  "https://api.mapbox.com/styles/v1/lewmax/cjsyeb8sz0j391fog4ucxrkqy/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibGV3bWF4IiwiYSI6ImNqbmx3dDk5eDFwdnYza3E5eGQ4MGMyMzYifQ.aBTyyXEnL_C52ix-m08j0g",
                  additionalOptions: {
                    'accessToken':
                    'pk.eyJ1IjoibGV3bWF4IiwiYSI6ImNqbmx3dDk5eDFwdnYza3E5eGQ4MGMyMzYifQ.aBTyyXEnL_C52ix-m08j0g',
                    'id': 'mapbox.mapbox-streets-v7'
                  }),
            ]));
  }
}