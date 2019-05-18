import 'package:breezy/fragments/preferences.dart';
import 'package:breezy/mixins/validation_mixin.dart';
import 'package:breezy/screens/new_drawer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import '../pages/home_page.dart';

class MapFragment extends StatefulWidget {
  @override
  _MapFragmentState createState() {
    return _MapFragmentState();
  }
}

class _MapFragmentState extends State<MapFragment> with ValidationMixin {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(49.8450449, 24.0361399);
  Set<Marker> markers = Set();
  MapType _currentMapType = MapType.normal;
  LatLng centerPosition;

  String endPoint = '';
  final formKey = GlobalKey<FormState>();

  void _onCameraMove(CameraPosition position) {
    centerPosition = position.target;
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NewDrawer(),
      body: Container(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              myLocationEnabled: true,
              mapType: _currentMapType,
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
            endPointField(),
            buildRouteButton(),
          ],
        ),
      ),
    );
  }

  final data = Data(endPoint: "123");

  Widget buildRouteButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: 58,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Colors.grey, width: 0.0, style: BorderStyle.none),
              color: Colors.black),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: RaisedButton(
                  child: Text(
                    'Let\'s go',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/preferences');
                  },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                  ),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget endPointField() {
    return Positioned(
      top: 36.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Colors.grey, width: 0.0, style: BorderStyle.none),
              color: Colors.white),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: TextFormField(
                  validator: validateDestination,
                  onSaved: (String value) {
                    endPoint = value;
                  },
                  style: new TextStyle(
                      height: 0.8,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openEndDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Data {
  String endPoint;

  Data({this.endPoint});
}