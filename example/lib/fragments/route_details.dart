import 'package:location_example/app.dart';
import '../screens/new_drawer.dart';
import 'package:flutter/material.dart';
import 'map_fragment.dart';

class RouteDetails extends StatefulWidget {
  const RouteDetails(
      {this.startPoint,
      this.startPointLat,
      this.startPointLng,
      this.endPoint,
      this.endPointLat,
      this.endPointLng,
      this.numberOfGuests,
      this.budget});

  final String startPoint;
  final String startPointLat;
  final String startPointLng;
  final String endPoint;
  final String endPointLat;
  final String endPointLng;
  final String numberOfGuests;
  final String budget;

  @override
  _RouteDetailsState createState() => _RouteDetailsState();
}

class _RouteDetailsState extends State<RouteDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hi"),
        ),
        drawer: NewDrawer(),
        floatingActionButton: goToMapButton(),
        body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(241, 241, 245, 1)),
          child: ListView(
            children: <Widget>[
              hotel1(),
              hotel1(),
              hotel1(),
              hotel1(),
            ],
          ),
        ));
  }

  Widget hotel1() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                  borderRadius: new BorderRadius.circular(10.0),
                  child: Image.asset("assets/image/1.1.jpeg")),
            ),
            Positioned(
              right: 19,
              top: 12,
              child: IconButton(
                icon: Icon(hearth, color: hearthColor, size: 40),
                onPressed: () {
                  setState(() {
                    hearthClicked = !hearthClicked;
                    if (hearthClicked) {
                      hearth = Icons.favorite;
                      hearthColor = Colors.red;
                    } else {
                      hearth = Icons.favorite_border;
                      hearthColor = Colors.white;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget hotel2() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                  borderRadius: new BorderRadius.circular(10.0),
                  child: Image.asset("assets/image/1.1.jpeg")),
            ),
            Positioned(
              right: 19,
              top: 12,
              child: IconButton(
                icon: Icon(hearth, color: hearthColor, size: 40),
                onPressed: () {
                  setState(() {
                    hearthClicked = !hearthClicked;
                    if (hearthClicked) {
                      hearth = Icons.favorite;
                      hearthColor = Colors.red;
                    } else {
                      hearth = Icons.favorite_border;
                      hearthColor = Colors.white;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget hotel3() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                  borderRadius: new BorderRadius.circular(10.0),
                  child: Image.asset("assets/image/1.1.jpeg")),
            ),
            Positioned(
              right: 19,
              top: 12,
              child: IconButton(
                icon: Icon(hearth, color: hearthColor, size: 40),
                onPressed: () {
                  setState(() {
                    hearthClicked = !hearthClicked;
                    if (hearthClicked) {
                      hearth = Icons.favorite;
                      hearthColor = Colors.red;
                    } else {
                      hearth = Icons.favorite_border;
                      hearthColor = Colors.white;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget hotel4() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                  borderRadius: new BorderRadius.circular(10.0),
                  child: Image.asset("assets/image/1.1.jpeg")),
            ),
            Positioned(
              right: 19,
              top: 12,
              child: IconButton(
                icon: Icon(hearth, color: hearthColor, size: 40),
                onPressed: () {
                  setState(() {
                    hearthClicked = !hearthClicked;
                    if (hearthClicked) {
                      hearth = Icons.favorite;
                      hearthColor = Colors.red;
                    } else {
                      hearth = Icons.favorite_border;
                      hearthColor = Colors.white;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget hotel5() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                  borderRadius: new BorderRadius.circular(10.0),
                  child: Image.asset("assets/image/1.1.jpeg")),
            ),
            Positioned(
              right: 19,
              top: 12,
              child: IconButton(
                icon: Icon(hearth, color: hearthColor, size: 40),
                onPressed: () {
                  setState(() {
                    hearthClicked = !hearthClicked;
                    if (hearthClicked) {
                      hearth = Icons.favorite;
                      hearthColor = Colors.red;
                    } else {
                      hearth = Icons.favorite_border;
                      hearthColor = Colors.white;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget secondCity() {
    return Text(
      "Berlin",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
    );
  }

  var hearth = Icons.favorite_border;
  var hearthColor = Colors.white;
  bool hearthClicked = false;

/*Widget firstCity() {
  return Text(
    "Lviv",
    textAlign: TextAlign.left,
    style: TextStyle(
        fontSize: 50, color: Colors.white, fontStyle: FontStyle.italic),
  );
}

Widget hotelsList_1() {
  return ListView.separated(
    padding: const EdgeInsets.all(8.0),
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        color: Colors.amber,
        child: Center(child: Image(image: 1.1.png)),

      );
    },
  );
}
*/

  Widget thirdCity() {
    return Text(
      "Amsterdam",
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
    );
  }

  Widget goToMapButton() {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)),
      child: Container(
        child: Text(
          "Show Map",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPressed: () {
        Navigator.push(
            context,
            SlideRightRoute(
                widget: MapFragment(
                    widget.startPoint,
                    widget.startPointLat,
                    widget.startPointLng,
                    widget.endPoint,
                    widget.endPointLat,
                    widget.endPointLng,
                    widget.numberOfGuests,
                    widget.budget,
                    false)));
      },
    );
  }
}
