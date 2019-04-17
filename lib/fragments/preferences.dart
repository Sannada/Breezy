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
  bool _value19 = false;
  bool _value20 = false;
  bool _value21 = false;
  bool _value22 = false;
  bool _value23 = false;
  bool _value24 = false;
  bool _value25 = false;

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
            buildCheckbox(_value1, _value1Changed, "hiiiiii"),
            buildCheckbox(_value2, _value2Changed, "hiiiiii"),
            buildCheckbox(_value3, _value3Changed, "hiiiiii"),
            buildCheckbox(_value4, _value4Changed, "hiiiiii"),
            buildCheckbox(_value5, _value5Changed, "hiiiiii"),
            buildCheckbox(_value6, _value6Changed, "hiiiiii"),
            buildCheckbox(_value7, _value7Changed, "hiiiiii"),
            buildCheckbox(_value8, _value8Changed, "hiiiiii"),
            buildCheckbox(_value9, _value9Changed, "hiiiiii"),
            buildCheckbox(_value10, _value10Changed, "hiiiiii"),
            buildCheckbox(_value11, _value11Changed, "hiiiiii"),
            buildCheckbox(_value12, _value12Changed, "hiiiiii"),
            buildCheckbox(_value13, _value13Changed, "hiiiiii"),
            buildCheckbox(_value14, _value14Changed, "hiiiiii"),
            buildCheckbox(_value15, _value15Changed, "hiiiiii"),
            buildCheckbox(_value16, _value16Changed, "hiiiiii"),
            buildCheckbox(_value17, _value17Changed, "hiiiiii"),
            buildCheckbox(_value18, _value18Changed, "hiiiiii"),
            buildCheckbox(_value19, _value19Changed, "hiiiiii"),
            buildCheckbox(_value20, _value20Changed, "hiiiiii"),
            buildCheckbox(_value21, _value21Changed, "hiiiiii"),
            buildCheckbox(_value22, _value22Changed, "hiiiiii"),
            buildCheckbox(_value23, _value23Changed, "hiiiiii"),
            buildCheckbox(_value24, _value24Changed, "hiiiiii"),
            buildCheckbox(_value25, _value25Changed, "hiiiiii"),



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

  Widget buildCheckbox(value, valueChanged, title) {
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