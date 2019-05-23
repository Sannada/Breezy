import 'dart:math';
import 'package:location/location.dart';
import '../app.dart';
import '../fragments/preferences.dart';
import '../screens/new_drawer.dart';
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

  CameraPosition _currentCameraPosition;

  GoogleMap googleMap;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    if (widget.isChangeText) {
      print("No markers were set");
    } else {
      _add(double.parse(widget.startPointLat),
          double.parse(widget.startPointLng), widget.startPoint);
      _add(double.parse(widget.endPointLat), double.parse(widget.endPointLng),
          widget.endPoint);
    }
    widget.isChangeText
        ? _initialCamera = CameraPosition(
            target:
                _center,
            zoom: 4)
        : _initialCamera = CameraPosition(
            target: LatLng(double.parse(widget.startPointLat),
                double.parse(widget.startPointLng)),
            zoom: 10);
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

  void _remove() {
    setState(() {
      if (markers.containsKey(selectedMarker)) {
        markers.remove(selectedMarker);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NewDrawer(),
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
            buildRouteButton(),
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
                    child: Text(
                      widget.isChangeText
                          ? "Plan a Trip"
                          : "Back to Route Details",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
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
                        _currentCameraPosition = CameraPosition(
                            target: LatLng(_currentLocation.latitude,
                                _currentLocation.longitude),
                            zoom: 16);

                        final GoogleMapController controller =
                            await _controller.future;
                        controller.animateCamera(CameraUpdate.newCameraPosition(
                            _currentCameraPosition));
                      })),
            ],
          ),
        ),
      ),
    );
  }

//currentPosition = LatLng(item.lat, item.lng);

//final GoogleMapController controller = await _controller.future;
//controller.animateCamera(CameraUpdate.newCameraPosition(
//                      CameraPosition(target: currentPosition, zoom: 10)));

}
