import 'dart:async';
import 'package:flutter/material.dart';
import 'db_create_histori.dart';
import 'Histori.dart';

class AddUserDialog {
  final teNameSity = TextEditingController();
  final teFirstX = TextEditingController();
  Histori histori;

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.black54,
    decoration: TextDecoration.underline,
  );

  Widget buildAboutDialog(
      BuildContext context, _myHomePageState, bool isEdit, Histori histori) {
    if (histori != null) {
      this.histori=histori;
      teNameSity.text = histori.nameSity;
      teFirstX.text = histori.firstX;
    }

    return new AlertDialog(
      title: new Text(isEdit ? 'Додати' : 'Додати Подорож'),
      content: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTextField("Ведіть місто", teNameSity),
            getTextField("Ведіть Координати", teFirstX),
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
    var histori = new Histori(teNameSity.text, teFirstX.text);
    if (isEdit) {
      histori.setHistoriId(this.histori.id);
      await db.update(histori);
    } else {
      await db.saveHistori(histori);
    }
  }
}