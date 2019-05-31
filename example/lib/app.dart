import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'fragments/route_details.dart';
import 'fragments/preferences.dart';
import 'fragments/db_fragment.dart';
import 'package:location_example/StartScrean/splash_screen.dart';
import 'package:location_example/StartScrean/intro_screen.dart';

class MyApp extends StatelessWidget {
  final String startPoint = '';
  final String startPointLat = '';
  final String startPointLng = '';
  final String endPoint = '';
  final String endPointLat = '';
  final String endPointLng = '';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.black,
        accentColor: Colors.black,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/intro':
            return SlideRightRoute(widget: IntroScreen());
            break;
          case '/preferences':
            return SlideRightRoute(widget: Preferences());
            break;
          case '/route_details':
            return SlideRightRoute(
                widget: RouteDetails(
                    startPoint: startPoint,
                    startPointLat: startPointLat,
                    startPointLng: startPointLng,
                    endPoint: endPoint,
                    endPointLat: endPointLat,
                    endPointLng: endPointLng));
            break;
          case '/db_fragment':
            return SlideRightRoute(widget: DBFragment());
            break;
        }
      },
      home: SplashScreen(),
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
