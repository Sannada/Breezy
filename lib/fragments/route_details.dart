import 'package:breezy/screens/new_drawer.dart';
import 'package:flutter/material.dart';

class RouteDetails extends StatefulWidget {
  @override
  _RouteDetailState createState() => _RouteDetailState();
}

class _RouteDetailState extends State<RouteDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: Text('Route Details'),
        ),
      ),
      endDrawer: NewDrawer(),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new StuffInTiles(listOfTiles[index]);
        },
        itemCount: listOfTiles.length,
      ), // swap with Containers
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final MyTile myTile;

  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[_buildTiles(myTile)]);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty) return new ListTile(title: new Text(t.title));

    return new ExpansionTile(
      leading: Icon(Icons.location_city),
      trailing: Icon(Icons.arrow_drop_down_circle),
      key: new PageStorageKey<MyTile>(t),
      //add memory about expansion
      title: new Text(t.title),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  IconData icon;
  String title;
  List<MyTile> children;

  MyTile(this.icon, this.title, [this.children = const <MyTile>[]]);
}

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    Icons.location_city,
    ' Whole route details',
    <MyTile>[new MyTile(Icons.location_city, ' Bla-bla-bla ')],
  ),
  new MyTile(
    Icons.location_city,
    ' Lviv ',
    <MyTile>[new MyTile(Icons.location_city, ' Dogs ')],
  ),
  new MyTile(
    Icons.location_city,
    ' Kyiv ',
    <MyTile>[new MyTile(Icons.location_city, ' Tesla ')],
  ),
  new MyTile(
    Icons.location_city,
    ' Odessa ',
    <MyTile>[
      new MyTile(Icons.location_city, 'Google'),
    ],
  ),
];
