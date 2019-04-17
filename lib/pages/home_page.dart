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
        title: Text("Breezy"),
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
                    title: new Text("Preferences"),
                    trailing: new Icon(Icons.check_circle),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/preferences');
                    }),
                new ListTile(
                    title: new Text("Route details"),
                    trailing: new Icon(Icons.filter_list),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/route_details');
                    }),
                new ListTile(
                    title: new Text("Travel History"),
                    trailing: new Icon(Icons.history),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/travel_history');
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
      body: MapFragment(),
    );
  }
}