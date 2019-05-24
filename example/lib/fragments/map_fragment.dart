import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import '../app.dart';
import '../fragments/preferences.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';

class MapFragment extends StatefulWidget {
  const MapFragment(this.startPoint, this.startPointLat, this.startPointLng,
      this.endPoint, this.endPointLat, this.endPointLng, this.isChangeText);

  final String startPoint;
  final String startPointLat;
  final String startPointLng;
  final String endPoint;
  final String endPointLat;
  final String endPointLng;
  final bool isChangeText;

  @override
  _MapFragmentState createState() {
    return _MapFragmentState();
  }
}

class _MapFragmentState extends State<MapFragment> {
  LocationData _currentLocation;

  StreamSubscription<LocationData> _locationSubscription;

  Location _locationService = new Location();
  bool _permission = false;
  String error;

  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _initialCamera;

  GoogleMap googleMap;

  @override
  void initState() {
    super.initState();

    widget.isChangeText
        ? print('hi')
        : initPlatformState();

    isSeeable = !widget.isChangeText;

    if (!widget.isChangeText) {
      _add(double.parse(widget.startPointLat),
          double.parse(widget.startPointLng), widget.startPoint);
      _add(double.parse(widget.endPointLat), double.parse(widget.endPointLng),
          widget.endPoint);

      _initialCamera = CameraPosition(
          target: LatLng(double.parse(widget.startPointLat),
              double.parse(widget.startPointLng)),
          zoom: 10);
    } else {
      _initialCamera = CameraPosition(target: _center, zoom: 4);
      print('No markers were set');
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    await _locationService.changeSettings(
        accuracy: LocationAccuracy.HIGH, interval: 1000);

    LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        _permission = await _locationService.requestPermission();
        print("Permission: $_permission");
        if (_permission) {
          location = await _locationService.getLocation();

          _locationSubscription = _locationService
              .onLocationChanged()
              .listen((LocationData result) async {
            if (mounted) {
              setState(() {
                _currentLocation = result;
              });
            }
          });
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if (serviceStatusResult) {
          initPlatformState();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        error = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        error = e.message;
      }
      location = null;
    }
  }

  //GoogleMapController mapController;

  static const LatLng _center = const LatLng(0, 0);

  MapType _currentMapType = MapType.normal;
  LatLng centerPosition;

  String pointOfEnd = '';
  final formKey = GlobalKey<FormState>();

  void _onCameraMove(CameraPosition position) {
    centerPosition = position.target;
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  //Markers
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 1;

  @override
  void dispose() {
    super.dispose();
  }

  void _onMarkerTapped(MarkerId markerId) {
    final Marker tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        if (markers.containsKey(selectedMarker)) {
          final Marker resetOld = markers[selectedMarker]
              .copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[selectedMarker] = resetOld;
        }
        selectedMarker = markerId;
      });
    }
  }

  void _add(double lat, double lng, String title) {
    final int markerCount = markers.length;

    if (markerCount == 12) {
      return;
    }

    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        lat + sin(pi / 6.0) / 20.0,
        lng + cos(pi / 6.0) / 20.0,
      ),
      infoWindow: InfoWindow(title: title),
      onTap: () {
        _onMarkerTapped(markerId);
      },
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  /*void _remove() {
    setState(() {
      if (markers.containsKey(selectedMarker)) {
        markers.remove(selectedMarker);
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.0, color: Colors.white)),
                  accountName: Text("Maksym Levytskyi"),
                  accountEmail: Text("mr.lewmax@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromRGBO(2, 94, 231, 1),
                    radius: 100.0,
                    child: Text(
                      "M",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                  ),
                ),
                new Column(
                  children: <Widget>[
                    new ListTile(
                        title: new Text("Filter"),
                        trailing: new Icon(Icons.filter_list),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed('/preferences');
                        }),
                    new ListTile(
                        title: new Text("Trip details"),
                        trailing: new Icon(Icons.location_on),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed('/route_details');
                        }),
                    new ListTile(
                        title: new Text("Travel History"),
                        trailing: new Icon(Icons.access_time),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed('/db_fragment');
                        }),
                    widget.isChangeText
                        ? Text("")
                        : new ListTile(
                        title: new Text("Show Details"),
                        trailing: new Icon(Icons.details),
                        onTap: () {
                          Navigator.of(context).pop();
                          setState(() {
                            isSeeable = true;
                          });
                        })
                  ],
                )
              ],
            ),
          )),
      body: Container(
        child: Stack(
          children: <Widget>[
            googleMap = GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapType: _currentMapType,
              markers: Set<Marker>.of(markers.values),
              onCameraMove: _onCameraMove,
              initialCameraPosition: _initialCamera,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            detailsField(),
            buildRouteButton(),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.only(top: 23.0),
                    child: SizedBox(
                      width: 65,
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        height: 65,
                        color: Colors.black,
                        child: Icon(Icons.format_list_bulleted,
                            color: Colors.white),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  Widget buildRouteButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: 60,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Colors.grey, width: 0.0, style: BorderStyle.none),
              color: Colors.black),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          widget.isChangeText
                              ? Text('')
                              : Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          Text(
                            widget.isChangeText
                                ? "Plan a Trip"
                                : "Back to Route Details",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  color: Colors.black,
                  onPressed: () {
                    widget.isChangeText
                        ? Navigator.push(
                        context, SlideRightRoute(widget: Preferences()))
                        : Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                  child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      child: Icon(
                        Icons.near_me,
                        color: Colors.white,
                      ),
                      color: Colors.black,
                      onPressed: () async {
                        if (_currentLocation.latitude.toString() != null) {
                          final GoogleMapController controller =
                          await _controller.future;
                          controller.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(_currentLocation.latitude,
                                      _currentLocation.longitude),
                                  zoom: 16)));
                        } else {
                          print("Current location is not available!");
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }

  var containerHeight = 145.0; //48
  bool isSeeable;

  Widget detailsField() {
    return Visibility(
        visible: isSeeable,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 75), //75
              height: containerHeight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: Colors.grey,
                          width: 0.0,
                          style: BorderStyle.none),
                      color: Colors.black),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: RaisedButton(
                              color: Colors.black,
                              // Text: Route Details
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Details',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.left,
                                  )),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: MaterialButton(
                              //dropdown menu
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              color: Colors.black,

                              onPressed: () {
                                setState(() {
                                  isSeeable = false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.mapMarkerAlt,
                                    color: Color.fromRGBO(2, 94, 231, 1)),
                                Container(margin: EdgeInsets.only(top: 4)),
                                Icon(FontAwesomeIcons.mapMarkerAlt,
                                    color: Color.fromRGBO(2, 94, 231, 1)),
                                Container(margin: EdgeInsets.only(top: 4)),
                                Icon(FontAwesomeIcons.mapMarkerAlt,
                                    color: Color.fromRGBO(2, 94, 231, 1)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(margin: EdgeInsets.only(top: 2)),
                                Text("Lviv",
                                    style: TextStyle(color: Colors.white)),
                                Container(margin: EdgeInsets.only(top: 11)),
                                Text("Berlin",
                                    style: TextStyle(color: Colors.white)),
                                Container(margin: EdgeInsets.only(top: 11)),
                                Text("Amsterdam",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.child,
                                    color: Color.fromRGBO(2, 94, 231, 1),
                                    size: 22),
                                Container(margin: EdgeInsets.only(top: 4)),
                                Icon(FontAwesomeIcons.dollarSign,
                                    color: Color.fromRGBO(2, 94, 231, 1),
                                    size: 22),
                                Container(margin: EdgeInsets.only(bottom: 25)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(margin: EdgeInsets.only(top: 8)),
                                Row(
                                  children: <Widget>[
                                    Text("4",
                                        style: TextStyle(color: Colors.white)),
                                    Text(" guests",
                                        style:
                                        TextStyle(color: Colors.grey[500]))
                                  ],
                                ),
                                Container(margin: EdgeInsets.only(top: 10)),
                                Row(
                                  children: <Widget>[
                                    Text("2350",
                                        style: TextStyle(color: Colors.white)),
                                    Text("\$",
                                        style:
                                        TextStyle(color: Colors.grey[500])),
                                  ],
                                ),
                                Container(margin: EdgeInsets.only(bottom: 30)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.directions_car,
                                    color: Color.fromRGBO(2, 94, 231, 1)),
                                Container(margin: EdgeInsets.only(top: 4)),
                                Icon(Icons.home,
                                    color: Color.fromRGBO(2, 94, 231, 1)),
                                Container(margin: EdgeInsets.only(bottom: 25)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.check,
                                    size: 15.0, color: Colors.white),
                                Container(margin: EdgeInsets.only(top: 13)),
                                Icon(Icons.check,
                                    size: 15.0, color: Colors.white),
                                Container(margin: EdgeInsets.only(bottom: 25)),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }}