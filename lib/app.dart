import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'fragments/route_details.dart';
import 'fragments/map_fragment.dart';
import 'fragments/preferences.dart';
import 'fragments/db_fragment.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context)=> HomePage());
            break;
          case '/preferences':
            return MaterialPageRoute(builder: (context)=> Preferences());
            break;
          case '/route_details':
            return MaterialPageRoute(builder: (context)=> RouteDetails());
            break;
          case '/db_fragments':
            return MaterialPageRoute(builder: (context)=> DBFragment());
            break;
        }
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}