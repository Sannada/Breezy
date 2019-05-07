
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'add_histori_dialog.dart';
import 'Histori.dart';
import 'home_presenter.dart';

class HistoriList extends StatelessWidget {
  List<Histori> country;
  HomePresenter homePresenter;

  HistoriList(
      List<Histori> this.country,
      HomePresenter this.homePresenter, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: country == null ? 0 : country.length,
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
                            homePresenter.delete(country[index]),
                      ),
                      new Expanded(
                        child: new Padding(
                          padding: EdgeInsets.all(10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                country[index].startPoint +
                                    "-" +
                                    country[index].endPoint,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.lightBlueAccent),
                              ),
                              new Text(
                               "Min budget: " + country[index].minBudget,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.green),
                              ),
                              new Text(
                                "Max budget: " + country[index].maxBudget,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.red),
                              ),
                              new Text(
                                "Namber: " + country[index].numberOfGuests,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                              new Text(
                                "Дата: " + country[index].departureDate +
                                     "-" + country[index].arriveDate,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.indigo),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: const Color(0xFF167F67),
                            ),
                            onPressed: () => edit(country[index], context),
                          ),

                          new IconButton(
                            icon: const Icon(Icons.delete_forever,
                                color: const Color(0xFF167F67)),
                            onPressed: () =>
                                homePresenter.delete(country[index]),
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
  edit(Histori histori, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddHistoriDialog().buildAboutDialog(context, this, true, histori),
    );
    homePresenter.updateScreen();
  }

  String getShortName(Histori histori) {
    String shortName = "";
    if (!histori.startPoint.isEmpty) {
      shortName = histori.startPoint.substring(0, 1) + ".";
    }

    if (!histori.endPoint.isEmpty) {
      shortName = shortName + histori.endPoint.substring(0, 1);
    }
    return shortName;
  }
}