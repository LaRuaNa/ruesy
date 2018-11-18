import 'package:flutter/material.dart';

import 'package:ruesy/screens/card_screen.dart';
import 'package:ruesy/screens/home_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      title: 'Ruesy',
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
        '/card': (BuildContext context) => CardScreen(),
      },
    );
  }
}

