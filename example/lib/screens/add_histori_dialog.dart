import 'dart:async';
import 'package:flutter/material.dart';
import 'db_create_histori.dart';
import 'Histori.dart';

class AddHistoriDialog {
  final teFirstName = TextEditingController();
  final teLastFirstName = TextEditingController();
  final teDOB = TextEditingController();
  final teMax = TextEditingController();
  final teMin = TextEditingController();
  final teN = TextEditingController();
  final teD = TextEditingController();
  final teA = TextEditingController();

  Histori histori;

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  Widget buildAboutDialog(
      BuildContext context, _myHomePageState, bool isEdit, Histori histori) {
    if (histori != null) {
      this.histori=histori;
      teFirstName.text = histori.startPoint;
      teLastFirstName.text = histori.endPoint;
      teMin.text= histori.minBudget;
      teMax.text = histori.maxBudget;
      teN.text = histori.numberOfGuests;
      teD.text = histori.departureDate;
      teA.text= histori.arriveDate;
    }

    return new AlertDialog(
      title: new Text(isEdit ? 'Додати' : 'Додати нову подорож'),
      content: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTextField("Точка відправлення", teFirstName),
            getTextField("Кінцева точка", teLastFirstName),
            new GestureDetector(
              onTap: () {
                addRecord(isEdit);
                _myHomePageState.displayRecord();
                Navigator.of(context).pop();
              },
              child: new Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: getAppBorderButton(
                    isEdit?"Додати":"Додати", EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = new Padding(
      padding: const EdgeInsets.all(5.0),
      child: new TextFormField(
        controller: inputBoxController,
        decoration: new InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );

    return loginBtn;
  }

  Widget getAppBorderButton(String buttonLabel, EdgeInsets margin) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        border: Border.all(color: const Color(0xFF28324E)),
        borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
      ),
      child: new Text(
        buttonLabel,
        style: new TextStyle(
          color: const Color(0xFF28324E),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
    return loginBtn;
  }

  Future addRecord(bool isEdit) async {
    var db = new DatabaseHelper();
    var histori = new Histori(teFirstName.text, teLastFirstName.text,  teMax.text, teMin.text ,teN.text, teD.text ,teA.text );

    if (isEdit) {
      histori.setHistoriId(this.histori.id);
      await db.update(histori);
    } else {
      await db.saveHistori(histori);
    }
  }
}
