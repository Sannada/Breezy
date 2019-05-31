import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                border: Border.all(width: 0.0, color: Colors.white)),
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
                  title: new Text("Travel History"),
                  trailing: new Icon(Icons.access_time),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/db_fragment');
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
    ));
  }
}
