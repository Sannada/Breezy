import 'package:flutter/material.dart';
import 'homescreen.dart';

void main() => runApp(new DBTestPage());

class DBTestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Database',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor:  const Color(0xFF1B5E20),
        primaryColorDark: const Color(0xFF212121),
        accentColor: const Color(0xFF212121),
      ),
      home: new MyHomePage(title: 'Flutter Database'),
    );
  }
}

class DBFragment extends StatefulWidget {
  @override
  _DBFragmentState createState() => _DBFragmentState();
}

class _DBFragmentState extends State<DBFragment> {

  @override
  Widget build(BuildContext context) {
    return DBTestPage();
  }
}