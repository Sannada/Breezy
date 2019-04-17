import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() {
    // TODO: implement createState
    return _PreferencesState();
  }
}

class _PreferencesState extends State<Preferences> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String startPoint = '';
  String endPoint = '';
  String budget = '';
  String numberOfGuests = '';
  String arriveDate = '';
  String departDate = '';

  DateTime _arriveDate = new DateTime.now();
  DateTime _departDate = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectArriveDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _arriveDate,
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2020));

    if (picked != null && picked != _arriveDate) {
      arriveDate = 'Date selected: ${_arriveDate.toString()}';
      setState(() {
        _arriveDate = picked;
        arriveDate = 'Arrive date: ${_arriveDate.toString()}';
      });
    }
  }

  Future<Null> _selectDepartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _departDate,
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2020));

    if (picked != null && picked != _departDate) {
      arriveDate = 'Date selected: ${_departDate.toString()}';
      setState(() {
        _departDate = picked;
        departDate = 'Depart date: ${_departDate.toString()}';
      });
    }
  }

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Preferences"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      startPointField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      endPointField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      budgetField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      numberOfGuestsField(),
                      Container(margin: EdgeInsets.only(top: 10.0)),
                      calendar(),
                      Container(margin: EdgeInsets.only(top: 25.0)),
                      Row(
                        children: <Widget>[
                          submitButton(),
                          Container(margin: EdgeInsets.only(left: 25.0)),
                          resetButton(),
                        ],
                      ),
                    ],
                  )),
            ),
            buildCheckbox(_value1, _value1Changed, "hiii"),
            new Card(
              child: new CheckboxListTile(
                value: _value1,
                onChanged: _value1Changed,
                title: new Text('Air conditioning'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value2,
                onChanged: _value2Changed,
                title: new Text('Wifi'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value3,
                onChanged: _value3Changed,
                title: new Text('Kitchen'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value4,
                onChanged: _value4Changed,
                title: new Text('Entire place'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),


            new Card(
              child: new CheckboxListTile(
                value: _value5,
                onChanged: _value5Changed,
                title: new Text('...'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value6,
                onChanged: _value6Changed,
                title: new Text('Kitchen'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value7,
                onChanged: _value7Changed,
                title: new Text('Shampoo'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value8,
                onChanged: _value8Changed,
                title: new Text('Heating'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value9,
                onChanged: _value9Changed,
                title: new Text('Air conditioning'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value10,
                onChanged: _value10Changed,
                title: new Text('Washer'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value11,
                onChanged: _value11Changed,
                title: new Text('Dryer'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value12,
                onChanged: _value12Changed,
                title: new Text('Wifi'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value13,
                onChanged: _value13Changed,
                title: new Text('Breakfast'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value14,
                onChanged: _value14Changed,
                title: new Text('Indoor fireplace'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value15,
                onChanged: _value15Changed,
                title: new Text('Hangers'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value16,
                onChanged: _value16Changed,
                title: new Text('Iron'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value17,
                onChanged: _value17Changed,
                title: new Text('Hair dryer'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Laptop friendly workspace'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('TV'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Crib'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('High chair'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Self check-in'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Smoke detector'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Carbon monoxide detector'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Private bathroom'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('...'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Free parking on premises'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Gym'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Hot tub'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Pool'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('...House rules...'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Suitable for events'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Pets allowed'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Smoking allowed'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('...Accessibility...'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Step-free access'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Well-lit path to entrance'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Wide doorway'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Flat path to front door'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('..Bathroom..'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Step-free access'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Wide doorway'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Accessible-height bed'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Wide clearance to bed'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Electric profiling bed'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Step-free access'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Fixed grab bars for shower'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Fixed grab bars for toilet'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Wide doorway'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Roll-in shower'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Shower chair'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Handheld shower head'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Bathtub with bath chair'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Accessible-height toilet'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Wide clearance to shower, toilet'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('..Common areas..'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Step-free access'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Wide entryway'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('..Parking..'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Disabled parking spot'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('..Equipment..'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Mobile hoist'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Pool with pool hoist'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Ceiling hoist'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('...Property type...'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('House'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Apartment'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Bed and breakfast'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Boutique hotel'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Bungalow'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Cabin'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Chalet'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Cottage'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Guest suite'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Guesthouse'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Hostel'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Hotel'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Loft'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Resort'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Townhouse'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Villa'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('...Unique homes...'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Barn'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Boat'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Camper/RV'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Campsite'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Casa particular (Cuba)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Castle'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Cave'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Cycladic house (Greece)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Dammuso (Italy)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Dome house'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Earth house'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Farm stay'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Heritage hotel (India)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Houseboat'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Hut'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Igloo'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Island'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Lighthouse'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Minsu (Taiwan)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Nature lodge'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Pension (South Korea)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Plane'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Pousada'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Ryokan (Japan)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Shepherd\'s hut (U.K., France)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Tent'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Tiny house'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Tipi'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Treehouse'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Trullo (Italy)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Windmill'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Yurt'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text(''),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),















          ],
        ));

  }

  Widget startPointField() {
    return TextFormField(
      validator: validateDestination,
      onSaved: (String value) {
        startPoint = value;
      },
      decoration: InputDecoration(
        icon: Icon(Icons.place),
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
        icon: Icon(Icons.place),
        hintText: 'End point',
      ),
    );
  }

  Widget budgetField() {
    return TextFormField(
      validator: validateBudget,
      onSaved: (String value) {
        budget = value;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.attach_money),
        hintText: 'Budget',
      ),
    );
  }

  Widget numberOfGuestsField() {
    return TextFormField(
      validator: validateNumberOfGuests,
      onSaved: (String value) {
        numberOfGuests = value;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.people),
        hintText: 'Guests',
      ),
    );
  }

  Widget calendar() {
    return Column(
      children: <Widget>[
        new RaisedButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.calendar_today),
              new Text('$arriveDate')
            ],
          ),
          onPressed: () {
            _selectArriveDate(context);
          },
        ),
        new RaisedButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.calendar_today),
              new Text('$departDate')
            ],
          ),
          onPressed: () {
            _selectDepartDate(context);
          },
        )
      ],
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'Start point: $startPoint, endpoint: $endPoint, budget: $budget, number of guests: $numberOfGuests');
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

  Widget buildCheckbox(bool value, valueChanged, title) {
    return new Card(
      child: new CheckboxListTile(
        value: value,
        onChanged: valueChanged,
        title: new Text(title),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.red,
      ),
    );
  }
}
