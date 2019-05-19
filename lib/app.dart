import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'fragments/route_details.dart';
import 'fragments/preferences.dart';
import 'package:breezy/fragments/db_fragment.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor:  Colors.white,
        primaryColorDark: Colors.black,
        accentColor: Colors.black,

      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/preferences':
            return SlideRightRoute(widget:Preferences());
            break;
          case '/route_details':
            return SlideRightRoute(widget:RouteDetails());
            break;
          case '/db_fragment':
            return SlideRightRoute(widget:DBFragment());
            break;
        }
      },
      home: HomePage(),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}