import 'package:flutter/material.dart';
import '../fragments/map_fragment.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          // here we display the title corresponding to the fragment
          // you can instead choose to have a static title
          ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Maksym Levytskyi"),
              accountEmail: Text("mr.lewmax@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "M",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            new Column(
              children: <Widget>[
                new ListTile(
                    title: new Text("Maps"),
                    trailing: new Icon(Icons.map),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/maps');
                    }),
                new ListTile(
                    title: new Text("Preferences"),
                    trailing: new Icon(Icons.check_circle),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/preferences');
                    }),
                new ListTile(
                    title: new Text("Route details"),
                    trailing: new Icon(Icons.filter_list),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/route_details');
                    }),
                new ListTile(
                    title: new Text("Travel History"),
                    trailing: new Icon(Icons.history),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/travel_history');
                    }),
                new Divider(),
                new ListTile(
                  title: new Text("Close"),
                  trailing: new Icon(Icons.close),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            )
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Breezy", style: TextStyle(fontSize: 35),),
        ),
      ),
    );
  }
}
