import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location_example/fragments/preferences.dart';

import '../app.dart';
import 'package:flutter/material.dart';
import 'Histori.dart';
import 'home_presenter.dart';
import 'list.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements HomeContract {
  HomePresenter homePresenter;

  @override
  void initState() {
    super.initState();
    homePresenter = new HomePresenter(this);
  }

  displayRecord() {
    setState(() {});
  }

  /*Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
    Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.center;

    return new InkWell(
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            new Text('Історія Подорожей',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }*/

  /*Future _openAddHistoriDialog() async {
    //HomePageState homePageState = new HomePageState();
    showDialog(
      context: context,
 //     builder: (BuildContext context) =>
//
    );
    setState(() {});
  }*/

  /*List<Widget> _buildActions() {
    return <Widget>[
      new IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black26,
        ),
        onPressed: _openAddHistoriDialog,
      ),
    ];
  }*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Travel History"),
      ),
      drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.0, color: Colors.white)),
                  accountName: Text("Elon Musk"),
                  accountEmail: Text("elonmusk@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromRGBO(7, 93, 231, 1),
                    radius: 100.0,
                    child: Text(
                      "E",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                  ),
                ),
                new Column(
                  children: <Widget>[
                    new ListTile(
                        title: new Text("Filter"),
                        trailing: new Icon(Icons.filter_list),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,
                              SlideRightRoute(widget: Preferences()));
                        }),
                    new ListTile(
                        title: new Text("Settings"),
                        trailing: new Icon(Icons.settings),
                        onTap: () {}),
                    Divider(),
                    new ListTile(
                        title: new Text("Sing In"),
                        trailing: new Icon(FontAwesomeIcons.signInAlt),
                        onTap: () {

                        }),
                  ],
                )
              ],
            ),
          )),
      body: new FutureBuilder<List<Histori>>(
        future: homePresenter.getHistori(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          var data = snapshot.data;
          return snapshot.hasData
              ? new HistoriList(data,homePresenter)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void screenUpdate() {
    setState(() {});
  }
}