import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location_example/fragments/route_details.dart';
import '../fragments/preferences.dart';
import '../app.dart';
import 'add_histori_dialog.dart';
import 'Histori.dart';
import 'home_presenter.dart';
import 'db_create_histori.dart';

class HistoriList extends StatelessWidget {
  List<Histori> country;
  DatabaseHelper db = new DatabaseHelper();
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
              child: MaterialButton(
            color: Colors.white,
            splashColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  SlideRightRoute(
                      widget: RouteDetails(
                          startPoint: country[index].startPoint,
                          startPointLat: "49.83826",//Влад, зроби так щоб ці дані на сторінці Preferences теж передвались в базу
                          startPointLng: "24.02324",//Влад, зроби так щоб ці дані на сторінці Preferences теж передвались в базу
                          endPoint: country[index].endPoint,
                          endPointLat: "52.379189",//Влад, зроби так щоб ці дані на сторінці Preferences теж передвались в базу
                          endPointLng: "4.899431",//Влад, зроби так щоб ці дані на сторінці Preferences теж передвались в базу
                          budget: country[index].maxBudget,
                          numberOfGuests: country[index].numberOfGuests)));
            },

            child: new Container(
                color: Colors.white,
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      new Image.asset(
                        'assets/image/trevel.png',
                        height: 45,
                        width: 45,
                      ),
                      new Expanded(
                        child: new Padding(
                          padding: EdgeInsets.all(20.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                country[index].endPoint,
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black),
                              ),
                              new Text(
                                "Start Point: " + country[index].startPoint,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              new Text(
                                "Destination: " + country[index].endPoint,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              new Text(
                                "Budget: " + country[index].maxBudget,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              new Text(
                                "Departure Date: " +
                                    country[index].departureDate,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              new Text(
                                "Arrival Date: " + country[index].arriveDate,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              new Text(
                                "Number Of Guests: " +
                                    country[index].numberOfGuests,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new IconButton(
                            icon: const Icon(Icons.clear,
                                color: const Color(0xFF757575)),
                            onPressed: () =>
                                homePresenter.delete(country[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
          ));
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
