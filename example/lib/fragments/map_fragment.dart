import 'package:location/location.dart';

import '../app.dart';
import '../fragments/preferences.dart';
import '../mixins/validation_mixin.dart';
import '../screens/new_drawer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import '../screens/players.dart';
import 'package:flutter/services.dart';

class MapFragment extends StatefulWidget {
  @override
  _MapFragmentState createState() {
    return _MapFragmentState();
  }
}

class _MapFragmentState extends State<MapFragment> with ValidationMixin {
  LocationData _startLocation;
  LocationData _currentLocation;

  StreamSubscription<LocationData> _locationSubscription;

  Location _locationService = new Location();
  bool _permission = false;
  String error;

  bool currentWidget = true;

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(0, 0),
    zoom: 4,
  );

  CameraPosition _currentCameraPosition;

  GoogleMap googleMap;

  @override
  void initState() {
    super.initState();
    _loadData();
    initPlatformState();
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

    setState(() {
      _startLocation = location;
    });
  }

  slowRefresh() async {
    _locationSubscription.cancel();
    await _locationService.changeSettings(
        accuracy: LocationAccuracy.BALANCED, interval: 10000);
    _locationSubscription =
        _locationService.onLocationChanged().listen((LocationData result) {
      if (mounted) {
        setState(() {
          _currentLocation = result;
        });
      }
    });
  }

  //GoogleMapController mapController;

  static const LatLng _center = const LatLng(49.8450449, 24.0361399);

  LatLng currentPosition = _center;

  Set<Marker> _markers;
  MapType _currentMapType = MapType.normal;
  LatLng centerPosition;

  String pointOfEnd = '';
  final formKey = GlobalKey<FormState>();

  void _onCameraMove(CameraPosition position) {
    centerPosition = position.target;
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  AutoCompleteTextField searchTextField;

  TextEditingController controller = new TextEditingController();

  GlobalKey<AutoCompleteTextFieldState<Players>> key = new GlobalKey();

  void _loadData() async {
    await PlayersViewModel.loadPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NewDrawer(),
      body: Container(
        child: Stack(
          children: <Widget>[
            googleMap = GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
              initialCameraPosition: _initialCamera,
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

  Widget buildRouteButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: 90,
        width: 55,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                  color: Colors.grey, width: 0.0, style: BorderStyle.none),
              color: Colors.black),
          child: Column(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  child: Container(
                      child: Text(
                    "Go!",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.left,
                  )),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(context,
                        SlideRightRoute(widget: Preferences(pointOfEnd)));
                  },
                ),
              ),
              Expanded(
                  child: MaterialButton(
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

  bool isVisible = true;

  Widget endPointField() {
    return Positioned(
      top: 36.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey[350],
              blurRadius: 5.0, // has the effect of softening the shadow
              spreadRadius: 0.1, // has the effect of extending the shadow
              offset: Offset(
                0.0, // horizontal, move right 10
                0.3, // vertical, move down 10
              ))
        ]),
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
                child: searchTextField = AutoCompleteTextField<Players>(
                  key: key,
                  suggestions: PlayersViewModel.players,
                  clearOnSubmit: false,
                  submitOnSuggestionTap: true,
                  suggestionsAmount: 5,
                  itemBuilder: (context, item) {
                    return Visibility(
                        visible: isVisible,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              item.autocompleteterm,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                            ),
                            Text(
                              item.country,
                            )
                          ],
                        ));
                  },
                  onFocusChanged: (boolVar) {
                    setState(() {
                      isVisible = boolVar;
                    });
                  },
                  itemFilter: (item, query) {
                    return item.autocompleteterm
                        .toLowerCase()
                        .startsWith(query.toLowerCase());
                  },
                  itemSorter: (a, b) {
                    return a.autocompleteterm.compareTo(b.autocompleteterm);
                  },
                  itemSubmitted: (item) async {
                    setState(() {
                      searchTextField.textField.controller.text =
                          item.autocompleteterm;
                      pointOfEnd = item.autocompleteterm;
                      currentPosition = LatLng(item.lat, item.lng);
                    });
                    final GoogleMapController controller =
                        await _controller.future;
                    controller.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(target: currentPosition, zoom: 10)));
//                    mapController.moveCamera(CameraUpdate.newCameraPosition(
//                        CameraPosition(target: currentPosition, zoom: 10)));
                  },
                  style: new TextStyle(color: Colors.black, fontSize: 16.0),
                  decoration: new InputDecoration(
                    suffixIcon: Container(
                      padding: EdgeInsets.all(50.0),
                      width: 50.0,
                      height: 50.0,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10.0, 19.0, 10.0, 20.0),
                    hintText: 'Search Player Name',
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
