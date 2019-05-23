import 'package:flutter/material.dart';


class NewDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.white,
      child: new Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              border: Border.all(width: 0.0, color: Colors.white)
            ),
            accountName: Text("Maksym Levytskyi"),
            accountEmail: Text("mr.lewmax@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.fromRGBO(2, 94, 231, 1),
              radius: 100.0,
              child: Text(
                "M",
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
          ),
          new Column(
            children: <Widget>[
              new ListTile(
                  title: new Text("Map"),
                  leading: new Icon(Icons.map),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/map_fragment');
                  }),
              new ListTile(
                  title: new Text("Filter"),
                  leading: new Icon(Icons.filter_list),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/preferences');
                  }),
              new ListTile(
                  title: new Text("Route details"),
                  leading: new Icon(Icons.location_on),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/route_details');
                  }),
              new ListTile(
                  title: new Text("Travel History"),
                  leading: new Icon(Icons.access_time),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/db_fragment');
                  }),
            ],
          )
        ],
      ),
    ));
  }
}
