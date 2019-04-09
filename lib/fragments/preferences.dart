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
            new Card(
              child: new CheckboxListTile(
                value: _value1,
                onChanged: _value1Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value2,
                onChanged: _value2Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value3,
                onChanged: _value3Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value4,
                onChanged: _value4Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value5,
                onChanged: _value5Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value6,
                onChanged: _value6Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value7,
                onChanged: _value7Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value8,
                onChanged: _value8Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value9,
                onChanged: _value9Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value10,
                onChanged: _value10Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value11,
                onChanged: _value11Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value12,
                onChanged: _value12Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value13,
                onChanged: _value13Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value14,
                onChanged: _value14Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value15,
                onChanged: _value15Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value16,
                onChanged: _value16Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value17,
                onChanged: _value17Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
              ),
            ),
            new Card(
              child: new CheckboxListTile(
                value: _value18,
                onChanged: _value18Changed,
                title: new Text('Hello World'),
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
}
