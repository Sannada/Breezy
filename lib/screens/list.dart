import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Histori.dart';
import 'home_presenter.dart';

class HistoriList extends StatelessWidget {
  List<Histori> travelHistori;
  HomePresenter homePresenter;

  HistoriList(
      List<Histori> this.travelHistori,
      HomePresenter this.homePresenter, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: travelHistori == null ? 0 : travelHistori.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      new IconButton(
                        icon: const Icon(Icons.map,
                            color: const Color(0xFF167F67)),

                        onPressed: () =>
                            homePresenter.delete(travelHistori[index]),
                      ),
                      new Expanded(
                        child: new Padding(
                          padding: EdgeInsets.all(10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                travelHistori[index].startPoint,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black),
                              ),
                              new Text(
                                " " + travelHistori[index].endPoint,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new IconButton(
                            icon: const Icon(Icons.delete_forever,
                                color: const Color(0xFF167F67)),
                            onPressed: () =>
                                homePresenter.delete(travelHistori[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
          );
        });
  }

  displayRecord() {
    homePresenter.updateScreen();
  }


}