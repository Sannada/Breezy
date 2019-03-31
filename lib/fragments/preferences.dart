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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
            )));
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
          print('Start point: $startPoint, endpoint: $endPoint, budget: $budget, number of guests: $numberOfGuests');
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
