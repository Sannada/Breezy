import 'package:breezy/fragments/map_fragment.dart';
import 'package:breezy/pages/home_page.dart';
import 'package:breezy/screens/Histori.dart';
import 'package:breezy/screens/new_drawer.dart';
import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';
import 'package:breezy/screens/db_create_histori.dart';
import 'package:breezy/screens/Trevel.dart';
import 'dart:async';

final teFirstName = TextEditingController();
final teLastFirstName = TextEditingController();
final teDOB = TextEditingController();

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  List<RangeSliderData> rangeSliders;

  String calendarField = "Pick the date";

  String startPoint = '';
  String endPoint = '';

  String minBudget = '';
  String maxBudget = '';
  String numberOfGuests = '';

  int houseTypeInt;
  String houseType;

  DateTime _departDate = new DateTime.now();
  DateTime _arriveDate = new DateTime.now();

  List<Widget> _buildRangeSliders() {
    List<Widget> children = <Widget>[];
    for (int index = 0; index < rangeSliders.length; index++) {
      children
          .add(rangeSliders[index].build(context, (double lower, double upper) {
// adapt the RangeSlider lowerValue and upperValue
        setState(() {
          rangeSliders[index].lowerValue = lower;
          rangeSliders[index].upperValue = upper;
        });
      }));
// Add an extra padding at the bottom of each RangeSlider
      children.add(new SizedBox(height: 8.0));
    }

    return children;
  }

  List<RangeSliderData> _rangeSliderDefinitions() {
    return <RangeSliderData>[
      RangeSliderData(
          min: 0.0,
          max: 100.0,
          lowerValue: 10.0,
          upperValue: 30.0,
          showValueIndicator: false,
          valueIndicatorMaxDecimals: 0),
    ];
  }

  Color color1 = Color.fromRGBO(2, 94, 231, 1);
  Color color2 = Colors.white;

  Color mainColor1;
  Color mainColor2;
  Color mainColor3;

  @override
  void initState() {
    super.initState();
    rangeSliders = _rangeSliderDefinitions();
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

  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  bool _value6 = false;
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
  bool _value27 = false;
  bool _value28 = false;
  bool _value29 = false;
  bool _value30 = false;
  bool _value31 = false;
  bool _value32 = false;
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
  bool _value49 = false;
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

  void _value1Changed(bool value) => setState(() => _value1 = value);

  void _value2Changed(bool value) => setState(() => _value2 = value);

  void _value3Changed(bool value) => setState(() => _value3 = value);

  void _value4Changed(bool value) => setState(() => _value4 = value);

  void _value5Changed(bool value) => setState(() => _value5 = value);

  void _value6Changed(bool value) => setState(() => _value6 = value);

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

  void _value27Changed(bool value) => setState(() => _value27 = value);

  void _value28Changed(bool value) => setState(() => _value28 = value);

  void _value29Changed(bool value) => setState(() => _value29 = value);

  void _value30Changed(bool value) => setState(() => _value30 = value);

  void _value31Changed(bool value) => setState(() => _value31 = value);

  void _value32Changed(bool value) => setState(() => _value32 = value);

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

  void _value49Changed(bool value) => setState(() => _value49 = value);

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

  double _value = 0.0;

  void _setvalue(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
      ),
      endDrawer: NewDrawer(),
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
                      new Text('Value: ${(_value * 100).round()}'),
                      new Slider(value: _value, onChanged: _setvalue),
                      buildHouseTypeBar(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      numberOfGuestsField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      calendar(),
                      Container(margin: EdgeInsets.only(top: 25.0)),
                      ExpansionTile(
                        title: Container(
                          child: Text("Home type"),
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
                          child: Text("Amenities"),
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
                          child: Text("Facilities"),
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
                          child: Text("Property type"),
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
                          child: Text("House rules"),
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
                          child: Text("Accessibility"),
                        ),
                        children: <Widget>[
                          Text(
                            'Entering the home',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          buildCheckbox(
                              _value53, _value50Changed, "Step-free access"),
                          buildCheckbox(_value54, _value51Changed,
                              "Well-lit path to entrance"),
                          buildCheckbox(
                              _value55, _value52Changed, "Wide doorway"),
                          buildCheckbox(_value56, _value52Changed,
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
                          buildCheckbox(_value66, _value65Changed,
                              "Wide clearance to bed"),
                          buildCheckbox(_value67, _value65Changed,
                              "Electric profiling bed"),
                          Text(
                            'Bedroom',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          submitButton(),
                          Container(margin: EdgeInsets.only(left: 25.0)),
                          resetButton(),
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

  Widget startPointField() {
    return TextFormField(
      validator: validateDestination,
      onSaved: (String value) {
        startPoint = value;
      },
      decoration: InputDecoration(
        hintText: 'Start point',
      ),
    );
  }

  Widget endPointField() {
    return TextFormField(
      validator: validateDestination,
      onSaved: (String value) {
        endPoint = value;
      },
      decoration: InputDecoration(
        hintText: 'End point',
      ),
    );
  }

  Widget budgetSlider() {
    return new Container(
      child: new Column(children: <Widget>[]..addAll(_buildRangeSliders())),
    );
  }

  Widget numberOfGuestsField() {
    return DropdownButton(
      hint: Text('Number of guests'), // Not necessary for Option 1
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
            borderRadius: new BorderRadius.circular(20.0)),
        color: Colors.blue,
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
              calendarField = "${DateFormat.yMMMd().format(_departDate)}"
                  " - ${DateFormat.yMMMd().format(_arriveDate)}";
            });
            print(calendarField);
          }
        },
        child: new Text(
          calendarField,
          style: new TextStyle(fontFamily: 'Dokdo', fontSize: 25.0),
        ));
  }

  Widget buildCheckbox(value, valueChanged, title) {
    return new CheckboxListTile(
      value: value,
      onChanged: valueChanged,
      title: new Text(title),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.red,
    );
  }

  Widget buildHouseTypeBar() {
    final _kTapPages = <Widget>[
      Tab(
        icon: Icon(Icons.cloud,
            size: 35.0,
            color: mainColor1),
        text: "All",
      ),
      Tab(
        icon: Icon(Icons.alarm,
            size: 35.0,
            color: mainColor2),
        text: "Houses",
      ),
      Tab(
        icon: Icon(Icons.forum,
            size: 35.0,
            color: mainColor3),
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
                  case 0: {
                    houseType = "All";
                  }
                  break;

                  case 1: {
                    houseType = "Houses";
                  }
                  break;

                  case 2: {
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
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () async {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();

          Histori histori = new Histori(
              startPoint,
              endPoint,
              rangeSliders[0].lowerValue.round().toString(),
              rangeSliders[0].upperValue.round().toString(),
              numberOfGuests,
              DateFormat.yMMMd().format(_departDate),
              DateFormat.yMMMd().format(_arriveDate));
          String data =
              "${DateFormat.yMMMd().format(_departDate)}, ${DateFormat.yMMMd().format(_arriveDate)}";

          DatabaseHelper databaseHelper = new DatabaseHelper();

          await databaseHelper.saveHistori(histori);

          print('Start point: $startPoint, endpoint: $endPoint, '
              'min budget: ${rangeSliders[0].lowerValue.round()}, '
              'max budget: ${rangeSliders[0].upperValue.round()}, '
              'number of guests: $_selectedLocation, '
              'type of house: $houseType, '
              'departure date: ${DateFormat.yMMMd().format(_departDate)}, '
              'arrive date: ${DateFormat.yMMMd().format(_arriveDate)}');
        }
      },
    );
  }

  Widget resetButton() {
    return RaisedButton(
      color: Colors.green,
      child: Text('Reset'),
      onPressed: () {
        formKey.currentState.reset();
      },
    );
  }
}

class RangeSliderData {
  double min;
  double max;
  double lowerValue;
  double upperValue;
  int divisions;
  bool showValueIndicator;
  int valueIndicatorMaxDecimals;
  bool forceValueIndicator;
  Color overlayColor;
  Color activeTrackColor;
  Color inactiveTrackColor;
  Color thumbColor;
  Color valueIndicatorColor;
  Color activeTickMarkColor;

  static const Color defaultActiveTrackColor = const Color(0xFF0175c2);
  static const Color defaultInactiveTrackColor = const Color(0x3d0175c2);
  static const Color defaultActiveTickMarkColor = const Color(0x8a0175c2);
  static const Color defaultThumbColor = const Color(0xFF0175c2);
  static const Color defaultValueIndicatorColor = const Color(0xFF0175c2);
  static const Color defaultOverlayColor = const Color(0x290175c2);

  RangeSliderData({
    this.min,
    this.max,
    this.lowerValue,
    this.upperValue,
    this.divisions,
    this.showValueIndicator: true,
    this.valueIndicatorMaxDecimals: 1,
    this.forceValueIndicator: false,
    this.overlayColor: defaultOverlayColor,
    this.activeTrackColor: defaultActiveTrackColor,
    this.inactiveTrackColor: defaultInactiveTrackColor,
    this.thumbColor: defaultThumbColor,
    this.valueIndicatorColor: defaultValueIndicatorColor,
    this.activeTickMarkColor: defaultActiveTickMarkColor,
  });

  String get lowerValueText =>
      lowerValue.toStringAsFixed(valueIndicatorMaxDecimals);

  String get upperValueText =>
      upperValue.toStringAsFixed(valueIndicatorMaxDecimals);

  Widget build(BuildContext context, RangeSliderCallback callback) {
    return new Container(
      width: double.infinity,
      child: new Row(
        children: <Widget>[
          new Container(
            constraints: new BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: new Text(lowerValueText),
          ),
          new Expanded(
            child: new SliderTheme(
// Customization of the SliderTheme
// based on individual definitions
// (see rangeSliders in _RangeSliderSampleState)
              data: SliderTheme.of(context).copyWith(
                overlayColor: Colors.green,
                activeTickMarkColor: Colors.green,
                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.green,
                thumbColor: Colors.green,
                valueIndicatorColor: Colors.green,
                showValueIndicator: showValueIndicator
                    ? ShowValueIndicator.always
                    : ShowValueIndicator.onlyForDiscrete,
              ),
              child: new RangeSlider(
                min: min,
                max: max,
                lowerValue: lowerValue,
                upperValue: upperValue,
                divisions: divisions,
                showValueIndicator: showValueIndicator,
                valueIndicatorMaxDecimals: valueIndicatorMaxDecimals,
                onChanged: (double lower, double upper) {
// call
                  callback(lower, upper);
                },
              ),
            ),
          ),
          new Container(
            constraints: new BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: new Text(upperValueText),
          ),
        ],
      ),
    );
  }
}