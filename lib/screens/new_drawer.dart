import 'package:flutter/material.dart';

class NewDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Maksym Levytskyi"),
            accountEmail: Text("mr.lewmax@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
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
                  title: new Text("Filter"),
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
                    Navigator.of(context).pushNamed('/db_fragment');
                  }),
            ],
          )
        ],
      ),
    );
  }
}
