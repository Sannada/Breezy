import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'route_details.dart';
import 'package:location_example/screens/players.dart';
import '../app.dart';
import '../screens/Histori.dart';
import '../screens/new_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';
import '../screens/db_create_histori.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:intl/intl.dart' as intl;

final teFirstName = TextEditingController();
final teLastFirstName = TextEditingController();
final teDOB = TextEditingController();

class Preferences extends StatefulWidget {
  const Preferences(
      {this.startPoint,
      this.endPoint,
      //this.minBudget,
      this.budget,
      this.numberOfGuests,
      this.departureDate,
      this.arivalDate});

  final String startPoint;
  final String endPoint;

  //final String minBudget;
  final String budget;
  final String numberOfGuests;
  final String departureDate;
  final String arivalDate;

  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  final formKey = GlobalKey<FormState>();

  String calendarData = "Pick the date";

  String startPoint = '';
  String endPoint = '';

  String startPointLat = '';
  String startPointLng = '';
  String endPointLat = '';
  String endPointLng = '';

  String numberOfGuests = '';

  int houseTypeInt;
  String houseType;

  DateTime _departDate = new DateTime.now();
  DateTime _arriveDate = new DateTime.now();

  Color color1 = Color.fromRGBO(2, 94, 231, 1);
  Color color2 = Colors.white;

  Color mainColor1;
  Color mainColor2;
  Color mainColor3;

  @override
  void initState() {
    super.initState();
    //rangeSliders[0].setUpperText(300.0);
    if (widget.startPoint != null && widget.endPoint != null) {
      controllerStart.text = widget.startPoint;
      controllerEnd.text = widget.endPoint;
      _selectedLocation = widget.numberOfGuests;
      //_lowerValue = double.parse(widget.minBudget);
      _upperValue = double.parse(widget.budget); //змінити на maxBudget
      calendarData = "${widget.departureDate} - ${widget.arivalDate}";
    }

    minBudget = _lowerValue.toInt();
    maxBudget = _upperValue.toInt();

    if (houseTypeInt == 0) {
      mainColor1 = color1;
      mainColor2 = color2;
      mainColor3 = color2;
    } else if (houseTypeInt == 1) {
      mainColor1 = color2;
      mainColor2 = color1;
      mainColor3 = color2;
    } else if (houseTypeInt == 2) {
      mainColor1 = color2;
      mainColor2 = color2;
      mainColor3 = color1;
    }
    _loadData();
  }

  List<String> _locations = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8'
  ]; // Option 2
  String _selectedLocation;

  //bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;

  //bool _value6 = false;
  bool _value7 = false;
  bool _value8 = false;
  bool _value9 = false;
  bool _value10 = false;
  bool _value11 = false;
  bool _value12 = false;
  bool _value13 = false;
  bool _value14 = false;
  bool _value15 = false;
  bool _value16 = false;
  bool _value17 = false;
  bool _value18 = false;
  bool _value19 = false;
  bool _value20 = false;
  bool _value21 = false;
  bool _value22 = false;
  bool _value23 = false;
  bool _value24 = false;
  bool _value25 = false;
  bool _value26 = false;

  //bool _value27 = false;
  bool _value28 = false;
  bool _value29 = false;
  bool _value30 = false;
  bool _value31 = false;

  //bool _value32 = false;
  bool _value33 = false;
  bool _value34 = false;
  bool _value35 = false;
  bool _value36 = false;
  bool _value37 = false;
  bool _value38 = false;
  bool _value39 = false;
  bool _value40 = false;
  bool _value41 = false;
  bool _value42 = false;
  bool _value43 = false;
  bool _value44 = false;
  bool _value45 = false;
  bool _value46 = false;
  bool _value47 = false;
  bool _value48 = false;

  //bool _value49 = false;
  bool _value50 = false;
  bool _value51 = false;
  bool _value52 = false;
  bool _value53 = false;
  bool _value54 = false;
  bool _value55 = false;
  bool _value56 = false;
  bool _value57 = false;
  bool _value58 = false;
  bool _value59 = false;
  bool _value60 = false;
  bool _value61 = false;
  bool _value62 = false;
  bool _value63 = false;
  bool _value64 = false;
  bool _value65 = false;
  bool _value66 = false;
  bool _value67 = false;

  //void _value1Changed(bool value) => setState(() => _value1 = value);

  void _value2Changed(bool value) => setState(() => _value2 = value);

  void _value3Changed(bool value) => setState(() => _value3 = value);

  void _value4Changed(bool value) => setState(() => _value4 = value);

  void _value5Changed(bool value) => setState(() => _value5 = value);

  //void _value6Changed(bool value) => setState(() => _value6 = value);

  void _value7Changed(bool value) => setState(() => _value7 = value);

  void _value8Changed(bool value) => setState(() => _value8 = value);

  void _value9Changed(bool value) => setState(() => _value9 = value);

  void _value10Changed(bool value) => setState(() => _value10 = value);

  void _value11Changed(bool value) => setState(() => _value11 = value);

  void _value12Changed(bool value) => setState(() => _value12 = value);

  void _value13Changed(bool value) => setState(() => _value13 = value);

  void _value14Changed(bool value) => setState(() => _value14 = value);

  void _value15Changed(bool value) => setState(() => _value15 = value);

  void _value16Changed(bool value) => setState(() => _value16 = value);

  void _value17Changed(bool value) => setState(() => _value17 = value);

  void _value18Changed(bool value) => setState(() => _value18 = value);

  void _value19Changed(bool value) => setState(() => _value19 = value);

  void _value20Changed(bool value) => setState(() => _value20 = value);

  void _value21Changed(bool value) => setState(() => _value21 = value);

  void _value22Changed(bool value) => setState(() => _value22 = value);

  void _value23Changed(bool value) => setState(() => _value23 = value);

  void _value24Changed(bool value) => setState(() => _value24 = value);

  void _value25Changed(bool value) => setState(() => _value25 = value);

  void _value26Changed(bool value) => setState(() => _value26 = value);

  //void _value27Changed(bool value) => setState(() => _value27 = value);

  void _value28Changed(bool value) => setState(() => _value28 = value);

  void _value29Changed(bool value) => setState(() => _value29 = value);

  void _value30Changed(bool value) => setState(() => _value30 = value);

  void _value31Changed(bool value) => setState(() => _value31 = value);

  //void _value32Changed(bool value) => setState(() => _value32 = value);

  void _value33Changed(bool value) => setState(() => _value33 = value);

  void _value34Changed(bool value) => setState(() => _value34 = value);

  void _value35Changed(bool value) => setState(() => _value35 = value);

  void _value36Changed(bool value) => setState(() => _value36 = value);

  void _value37Changed(bool value) => setState(() => _value37 = value);

  void _value38Changed(bool value) => setState(() => _value38 = value);

  void _value39Changed(bool value) => setState(() => _value39 = value);

  void _value40Changed(bool value) => setState(() => _value40 = value);

  void _value41Changed(bool value) => setState(() => _value41 = value);

  void _value42Changed(bool value) => setState(() => _value42 = value);

  void _value43Changed(bool value) => setState(() => _value43 = value);

  void _value44Changed(bool value) => setState(() => _value44 = value);

  void _value45Changed(bool value) => setState(() => _value45 = value);

  void _value46Changed(bool value) => setState(() => _value46 = value);

  void _value47Changed(bool value) => setState(() => _value47 = value);

  void _value48Changed(bool value) => setState(() => _value48 = value);

  //void _value49Changed(bool value) => setState(() => _value49 = value);

  void _value50Changed(bool value) => setState(() => _value50 = value);

  void _value51Changed(bool value) => setState(() => _value51 = value);

  void _value52Changed(bool value) => setState(() => _value52 = value);

  void _value53Changed(bool value) => setState(() => _value53 = value);

  void _value54Changed(bool value) => setState(() => _value54 = value);

  void _value55Changed(bool value) => setState(() => _value55 = value);

  void _value56Changed(bool value) => setState(() => _value56 = value);

  void _value57Changed(bool value) => setState(() => _value57 = value);

  void _value58Changed(bool value) => setState(() => _value58 = value);

  void _value59Changed(bool value) => setState(() => _value59 = value);

  void _value60Changed(bool value) => setState(() => _value60 = value);

  void _value61Changed(bool value) => setState(() => _value61 = value);

  void _value62Changed(bool value) => setState(() => _value62 = value);

  void _value63Changed(bool value) => setState(() => _value63 = value);

  void _value64Changed(bool value) => setState(() => _value64 = value);

  void _value65Changed(bool value) => setState(() => _value65 = value);

  void _value66Changed(bool value) => setState(() => _value66 = value);

  void _value67Changed(bool value) => setState(() => _value67 = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
      ),
      drawer: NewDrawer(),
      floatingActionButton: submitButton(),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(241, 241, 245, 1)),
        child: ListView(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      startPointField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      endPointField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      budgetSlider(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      buildHouseTypeBar(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      numberOfGuestsField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      calendar(),
                      Container(margin: EdgeInsets.only(top: 25.0)),
                      ExpansionTile(
                        title: Container(
                          child: Text("Home type",
                              style: TextStyle(fontSize: 18.0)),
                        ),
                        children: <Widget>[
                          buildCheckbox(
                              _value2, _value2Changed, "Entire place"),
                          buildCheckbox(
                              _value3, _value3Changed, "Private room"),
                          buildCheckbox(_value4, _value4Changed, "Hotel room"),
                          buildCheckbox(_value5, _value5Changed, "Shared room"),
                        ],
                      ),
                      ExpansionTile(
                        title: Container(
                          child: Text("Amenities",
                              style: TextStyle(fontSize: 18.0)),
                        ),
                        children: <Widget>[
                          buildCheckbox(_value7, _value7Changed, "Kitchen"),
                          buildCheckbox(_value8, _value8Changed, "Shampoo"),
                          buildCheckbox(_value9, _value9Changed, "Heating"),
                          buildCheckbox(
                              _value10, _value10Changed, "Air conditioning"),
                          buildCheckbox(_value11, _value11Changed, "Washer"),
                          buildCheckbox(_value12, _value12Changed, "Dryer"),
                          buildCheckbox(_value13, _value13Changed, "Wifi"),
                          buildCheckbox(_value14, _value14Changed, "Breakfast"),
                          buildCheckbox(
                              _value15, _value15Changed, "Indoor fireplace"),
                          buildCheckbox(_value16, _value16Changed, "Hangers"),
                          buildCheckbox(_value17, _value17Changed, "Iron"),
                          buildCheckbox(
                              _value18, _value18Changed, "Hair dryer"),
                          buildCheckbox(_value19, _value19Changed,
                              "Laptop friendly workspace"),
                          buildCheckbox(_value20, _value20Changed, "TV"),
                          buildCheckbox(_value21, _value21Changed, "Crib"),
                          buildCheckbox(
                              _value22, _value22Changed, "High chair"),
                          buildCheckbox(
                              _value23, _value23Changed, "Self check-in"),
                          buildCheckbox(
                              _value24, _value24Changed, "Smoke detector"),
                          buildCheckbox(_value25, _value25Changed,
                              "Carbon monoxide detector"),
                          buildCheckbox(
                              _value26, _value26Changed, "Private bathroom"),
                        ],
                      ),
                      ExpansionTile(
                        title: Container(
                          child: Text("Facilities",
                              style: TextStyle(fontSize: 18.0)),
                        ),
                        children: <Widget>[
                          buildCheckbox(_value28, _value28Changed,
                              "Free parking on premises"),
                          buildCheckbox(_value29, _value29Changed, "Gym"),
                          buildCheckbox(_value30, _value30Changed, "Hot tub"),
                          buildCheckbox(_value31, _value31Changed, "Pool"),
                        ],
                      ),
                      ExpansionTile(
                        title: Container(
                          child: Text("Property type",
                              style: TextStyle(fontSize: 18.0)),
                        ),
                        children: <Widget>[
                          buildCheckbox(_value33, _value33Changed, "House"),
                          buildCheckbox(_value34, _value34Changed, "Apartment"),
                          buildCheckbox(
                              _value35, _value35Changed, "Bed and breakfast"),
                          buildCheckbox(
                              _value36, _value36Changed, "Boutique hotel"),
                          buildCheckbox(_value37, _value37Changed, "Bungalow"),
                          buildCheckbox(_value38, _value38Changed, "Cabin"),
                          buildCheckbox(_value39, _value39Changed, "Chalet"),
                          buildCheckbox(_value40, _value40Changed, "Cottage"),
                          buildCheckbox(
                              _value41, _value41Changed, "Guest suite"),
                          buildCheckbox(
                              _value42, _value42Changed, "Guesthouse"),
                          buildCheckbox(_value43, _value43Changed, "Hostel"),
                          buildCheckbox(_value44, _value44Changed, "Hotel"),
                          buildCheckbox(_value45, _value45Changed, "Loft"),
                          buildCheckbox(_value46, _value46Changed, "Resort"),
                          buildCheckbox(_value47, _value47Changed, "Townhouse"),
                          buildCheckbox(_value48, _value48Changed, "Villa"),
                        ],
                      ),
                      ExpansionTile(
                        title: Container(
                          child: Text("House rules",
                              style: TextStyle(fontSize: 18.0)),
                        ),
                        children: <Widget>[
                          buildCheckbox(
                              _value50, _value50Changed, "Suitable for events"),
                          buildCheckbox(
                              _value51, _value51Changed, "Pets allowed"),
                          buildCheckbox(
                              _value52, _value52Changed, "Smoking allowed"),
                        ],
                      ),
                      ExpansionTile(
                        title: Container(
                          child: Text("Accessibility",
                              style: TextStyle(fontSize: 18.0)),
                        ),
                        children: <Widget>[
                          Text(
                            'Entering the home',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          buildCheckbox(
                              _value53, _value53Changed, "Step-free access"),
                          buildCheckbox(_value54, _value54Changed,
                              "Well-lit path to entrance"),
                          buildCheckbox(
                              _value55, _value55Changed, "Wide doorway"),
                          buildCheckbox(_value56, _value56Changed,
                              "Flat path to front door"),
                          Text(
                            'Entering the home',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          buildCheckbox(
                              _value57, _value57Changed, "Step-free access"),
                          buildCheckbox(_value58, _value58Changed,
                              "Well-lit path to entrance"),
                          buildCheckbox(
                              _value59, _value59Changed, "Wide doorway"),
                          buildCheckbox(_value60, _value60Changed,
                              "Flat path to front door"),
                          Text(
                            'Getting around',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          buildCheckbox(_value61, _value61Changed,
                              "Wide hallway clearance"),
                          buildCheckbox(_value62, _value62Changed, "Elevator"),
                          Text(
                            'Bedroom',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          buildCheckbox(
                              _value63, _value63Changed, "Step-free access"),
                          buildCheckbox(
                              _value64, _value64Changed, "Wide doorway"),
                          buildCheckbox(_value65, _value65Changed,
                              "Accessible-height bed"),
                          buildCheckbox(_value66, _value66Changed,
                              "Wide clearance to bed"),
                          buildCheckbox(_value67, _value67Changed,
                              "Electric profiling bed"),
                          Text(
                            'Bedroom',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    controllerStart.dispose();
    controllerEnd.dispose();
    super.dispose();
  }

  AutoCompleteTextField searchStartPoint;
  TextEditingController controllerStart = new TextEditingController();
  TextEditingController controllerEnd = new TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<Players>> keyStart = new GlobalKey();

  bool isVisibleForStart = true;

  void _loadData() async {
    await PlayersViewModel.loadPlayers();
  }

  bool isFilledStart = false;
  bool isFilledEnd = false;

  Widget startPointField() {
    return Container(
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
        child: searchStartPoint = AutoCompleteTextField<Players>(
          key: keyStart,
          controller: controllerStart,
          suggestions: PlayersViewModel.players,
          clearOnSubmit: false,
          submitOnSuggestionTap: true,
          suggestionsAmount: 5,
          itemBuilder: (context, item) {
            return Visibility(
                visible: isVisibleForStart,
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
              isVisibleForStart = boolVar;
            });
          },
          itemFilter: (item, query) {
            return item.autocompleteterm
                .toLowerCase()
                .startsWith(query.toLowerCase());
          },
          itemSorter: (a, b) {
            isFilledStart = false;
            return a.autocompleteterm.compareTo(b.autocompleteterm);
          },
          itemSubmitted: (item) async {
            setState(() {
              searchStartPoint.textField.controller.text =
                  item.autocompleteterm;
              startPoint = item.autocompleteterm;

              startPointLat = item.lat.toString();
              startPointLng = item.lng.toString();
              isFilledStart = true;
            });
          },
          style: new TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: new InputDecoration(
            suffixIcon: Container(
              padding: EdgeInsets.all(50.0),
              width: 50.0,
              height: 50.0,
            ),
            contentPadding: EdgeInsets.fromLTRB(10.0, 19.0, 10.0, 20.0),
            hintText: 'Start point',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AutoCompleteTextField searchEndPoint;
  GlobalKey<AutoCompleteTextFieldState<Players>> keyEnd = new GlobalKey();

  bool isVisibleForEnd = true;

  Widget endPointField() {
    return Container(
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
        child: searchEndPoint = AutoCompleteTextField<Players>(
          key: keyEnd,
          controller: controllerEnd,
          suggestions: PlayersViewModel.players,
          clearOnSubmit: false,
          submitOnSuggestionTap: true,
          suggestionsAmount: 5,
          itemBuilder: (context, item) {
            return Visibility(
                visible: isVisibleForEnd,
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
              isVisibleForEnd = boolVar;
            });
          },
          itemFilter: (item, query) {
            return item.autocompleteterm
                .toLowerCase()
                .startsWith(query.toLowerCase());
          },
          itemSorter: (a, b) {
            isFilledEnd = false;
            return a.autocompleteterm.compareTo(b.autocompleteterm);
          },
          itemSubmitted: (item) async {
            setState(() {
              searchEndPoint.textField.controller.text = item.autocompleteterm;
              endPoint = item.autocompleteterm;

              endPointLat = item.lat.toString();
              endPointLng = item.lng.toString();
              isFilledEnd = true;
            });
          },
          style: new TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: new InputDecoration(
            suffixIcon: Container(
              padding: EdgeInsets.all(50.0),
              width: 50.0,
              height: 50.0,
            ),
            contentPadding: EdgeInsets.fromLTRB(10.0, 19.0, 10.0, 20.0),
            hintText: 'End point',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _lowerValue = 500;
  double _upperValue = 800;

  int minBudget;
  int maxBudget;

  Widget budgetSlider() {
    return Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Budget:", style: TextStyle(color: Colors.grey)),
                Text("\$${minBudget.toString()} - ${maxBudget.toString()}",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            FlutterSlider(
              values: [500, 800],
              rangeSlider: true,
              //maximumDistance: 1000,
              max: 3000,
              min: 100,
              step: 10,
              jump: true,
              //minimumDistance: 20,
              trackBar: FlutterSliderTrackBar(
                  activeTrackBarColor: Color.fromRGBO(171, 201, 248, 1),
                  activeTrackBarHeight: 25,
                  inactiveTrackBarColor: Colors.white,
                  inactiveTrackBarHeight: 25),
              tooltip: FlutterSliderTooltip(
                textStyle: TextStyle(
                    fontSize: 17, color: Color.fromRGBO(2, 94, 231, 1)),
                numberFormat: intl.NumberFormat(),
              ),
              handler: FlutterSliderHandler(
                decoration: BoxDecoration(),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  type: MaterialType.canvas,
                  color: Color.fromRGBO(2, 94, 231, 1),
                  elevation: 10,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.adjust,
                        size: 30,
                        color: Color.fromRGBO(2, 94, 231, 1),
                      )),
                ),
              ),
              rightHandler: FlutterSliderHandler(
                child: Material(
                  borderRadius: new BorderRadius.circular(10.0),
                  type: MaterialType.canvas,
                  color: Color.fromRGBO(2, 94, 231, 1),
                  elevation: 10,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.adjust,
                        size: 30,
                        color: Color.fromRGBO(2, 94, 231, 1),
                      )),
                ),
              ),
              disabled: false,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                _lowerValue = lowerValue;
                _upperValue = upperValue;
                setState(() {
                  minBudget = _lowerValue.toInt();
                  maxBudget = _upperValue.toInt();
                });
              },
            ),
          ],
        ));
  }

  Widget numberOfGuestsField() {
    return DropdownButton(
      style: TextStyle(color: Colors.black),
      hint: Text(
        'Number of guests',
        style: TextStyle(color: Colors.grey),
      ),
      value: _selectedLocation,
      onChanged: (newValue) {
        setState(() {
          _selectedLocation = newValue;
          numberOfGuests = _selectedLocation;
        });
      },
      items: _locations.map((location) {
        return DropdownMenuItem(
          child: new Text(location),
          value: location,
        );
      }).toList(),
    );
  }

  Widget calendar() {
    return MaterialButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)),
        minWidth: double.infinity,
        color: Color.fromRGBO(2, 94, 231, 1),
        textColor: Colors.white,
        height: 50.0,
        onPressed: () async {
          final List<DateTime> picked = await DateRagePicker.showDatePicker(
              context: context,
              initialFirstDate: _departDate,
              initialLastDate: (_arriveDate).add(new Duration(days: 1)),
              firstDate: new DateTime(2019),
              lastDate: new DateTime(2020));
          if (picked != null && picked.length == 2) {
            print(picked);
            setState(() {
              _departDate = picked[0];
              _arriveDate = picked[1];
              calendarData = "${DateFormat.yMMMd().format(_departDate)}"
                  " - ${DateFormat.yMMMd().format(_arriveDate)}";
            });
            print(calendarData);
          }
        },
        child: new Text(
          calendarData,
          style: new TextStyle(fontFamily: 'Dokdo', fontSize: 20.0),
        ));
  }

  Widget buildCheckbox(value, valueChanged, title) {
    return new Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: CheckboxListTile(
          value: value,
          onChanged: valueChanged,
          title: new Text(title,
              style: TextStyle(fontSize: 15.0, color: Colors.grey[600])),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: Color.fromRGBO(2, 94, 231, 1),
        ));
  }

  Widget buildHouseTypeBar() {
    final _kTapPages = <Widget>[
      Tab(
        icon: Icon(Icons.cloud, size: 35.0, color: mainColor1),
        text: "All",
      ),
      Tab(
        icon: Icon(Icons.alarm, size: 35.0, color: mainColor2),
        text: "Houses",
      ),
      Tab(
        icon: Icon(Icons.forum, size: 35.0, color: mainColor3),
        text: "Hotels",
      ),
    ];
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey[350],
              blurRadius: 5.0, // has the effect of softening the shadow
              spreadRadius: 0.1, // has the effect of extending the shadow
              offset: Offset(
                0.0, // horizontal, move right 10
                0.3, // vertical, move down 10
              ))
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: DefaultTabController(
          length: _kTapPages.length,
          child: TabBar(
              onTap: (value) {
                houseTypeInt = value;
                print(houseTypeInt);
                switch (houseTypeInt) {
                  case 0:
                    {
                      houseType = "All";
                    }
                    break;

                  case 1:
                    {
                      houseType = "Houses";
                    }
                    break;

                  case 2:
                    {
                      houseType = "Hotels";
                    }
                    break;
                }
              },
              tabs: _kTapPages,
              labelPadding: EdgeInsets.all(10.0),
              labelColor: Colors.white,
              unselectedLabelColor: Color.fromRGBO(2, 94, 231, 1),
              indicator: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(2, 94, 231, 1),
                      blurRadius: 5.0,
                      // has the effect of softening the shadow
                      spreadRadius: 0.1,
                      // has the effect of extending the shadow
                      offset: Offset(
                        0.0, // horizontal, move right 10
                        0.3, // vertical, move down 10
                      ))
                ],
                color: Color.fromRGBO(2, 94, 231, 1),
                borderRadius: BorderRadius.circular(10.0),
              )),
        ));
  }

  Widget submitButton() {
    return Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
            width: 70,
            height: 50,
            child: FloatingActionButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              backgroundColor: Color.fromRGBO(2, 94, 231, 1),
              child: Text('Submit', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                //if (isFilledStart && isFilledEnd) {
                formKey.currentState.save();

                //Розкоментити коли клас History і базу буде змінено під структуру яка знизу
                Histori histori = new Histori(
                  startPoint,
                  //startPointLat,
                  //startPointLng,
                  endPoint,
                  //endPointLat,
                  //endPointLng,
                  minBudget.toString(),
                  maxBudget.toString(),
                  numberOfGuests,
                  //houseType,
                  DateFormat.yMMMd().format(_departDate),
                  DateFormat.yMMMd().format(_arriveDate),
                );

                DatabaseHelper databaseHelper = new DatabaseHelper();

                await databaseHelper.saveHistori(histori);

                print('Start point: $startPoint, endpoint: $endPoint, '
                    'min budget: ${minBudget.toString()}, '
                    'max budget: ${maxBudget.toString()}, '
                    'number of guests: $numberOfGuests, '
                    'type of house: $houseType, '
                    'departure date: ${DateFormat.yMMMd().format(_departDate)}, '
                    'arrive date: ${DateFormat.yMMMd().format(_arriveDate)}');

                Navigator.push(
                    context,
                    SlideRightRoute(
                        widget: RouteDetails(
                            startPoint: startPoint,
                            startPointLat: startPointLat,
                            startPointLng: startPointLng,
                            endPoint: endPoint,
                            endPointLat: endPointLat,
                            endPointLng: endPointLng,
                            budget: maxBudget.toString(),
                            numberOfGuests: numberOfGuests
                        )
                    )
                );
              },
            )));
  }
}
