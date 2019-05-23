import 'package:breezy/fragments/preferences.dart';
import 'package:breezy/mixins/validation_mixin.dart';
import 'package:breezy/screens/new_drawer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:breezy/screens/players.dart';
import 'package:flutter/services.dart';

class MapFragment extends StatefulWidget {
  @override
  _MapFragmentState createState() {
    return _MapFragmentState();
  }
}

class _MapFragmentState extends State<MapFragment> with ValidationMixin {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

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
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NewDrawer(),
      body: Container(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
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
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Let\'s go',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new Preferences(pointOfEnd),
                    ));
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
                      onPressed: () {

                      })
              ),
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
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
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
                  itemFilter: (item, query) {
                    return item.autocompleteterm
                        .toLowerCase()
                        .startsWith(query.toLowerCase());
                  },
                  itemSorter: (a, b) {
                    setState(() {
                      isVisible = !isVisible;
                    });
                    return a.autocompleteterm.compareTo(b.autocompleteterm);
                  },
                  itemSubmitted: (item) {
                    setState(() {
                      searchTextField.textField.controller.text =
                          item.autocompleteterm;
                      pointOfEnd = item.autocompleteterm;
                      isVisible = !isVisible;
                      currentPosition = LatLng(item.lat, item.lng);
                    });
                    mapController.moveCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(target: currentPosition, zoom: 10)));
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
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
