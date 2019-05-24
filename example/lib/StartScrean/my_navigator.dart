import 'package:flutter/material.dart';
import '../pages/home_page.dart';

import '../app.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.push(context, SlideRightRoute(widget: HomePage()));
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }
}
